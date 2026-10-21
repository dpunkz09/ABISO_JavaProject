
import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

public class CreateStaffAccount {

    public static void main(String[] args) {

        Console console = System.console();

        if (console == null) {
            System.err.println(
                    "Run this utility from a terminal so the password is hidden."
            );
            return;
        }

        char[] password = console.readPassword(
                "Enter a new staff password: "
        );

        if (password == null || password.length < 8) {
            System.out.println("Password must be at least 8 characters.");
            return;
        }

        String passwordHash = BCrypt.hashpw(
                new String(password),
                BCrypt.gensalt(12)
        );

        java.util.Arrays.fill(password, '\0');

        String sql = "INSERT INTO users "
                + "(full_name, email, password_hash, role) "
                + "VALUES (?, ?, ?, 'STAFF')";

        String staffSql = "INSERT INTO staff "
                + "(user_id, position, active) "
                + "VALUES (?, ?, 1)";

        try (Connection conn = Db.get()) {

            conn.setAutoCommit(false);

            try {
                int userId;

                try (PreparedStatement stmt
                        = conn.prepareStatement(
                                sql,
                                java.sql.Statement.RETURN_GENERATED_KEYS
                        )) {

                            stmt.setString(1, "ABISO Staff");
                            stmt.setString(2, "staff@abiso.local");
                            stmt.setString(3, passwordHash);
                            stmt.executeUpdate();

                            try (ResultSet keys = stmt.getGeneratedKeys()) {
                                if (!keys.next()) {
                                    throw new SQLException("No user ID returned.");
                                }
                                userId = keys.getInt(1);
                            }
                        }

                        try (PreparedStatement stmt
                                = conn.prepareStatement(staffSql)) {

                            stmt.setInt(1, userId);
                            stmt.setString(2, "Barangay Secretary");
                            stmt.executeUpdate();
                        }

                        conn.commit();

                        System.out.println(
                                "Staff account created successfully!"
                        );

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }

        } catch (SQLException e) {
            System.err.println(
                    "Staff creation failed: " + e.getMessage()
            );
        }
    }
}
