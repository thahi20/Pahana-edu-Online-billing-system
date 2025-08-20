package dao;

import model.User;
import java.io.*;
import java.util.*;

public class UserDAO {
    private final String FILE;

    // Constructor: pass folder path where users.txt will be saved
    public UserDAO(String dataDir) throws IOException {
        FILE = dataDir + File.separator + "users.txt";

        File file = new File(FILE);
        File parent = file.getParentFile();

        // Create folder if it doesn't exist
        if (!parent.exists()) {
            if (!parent.mkdirs()) {
                throw new IOException("Failed to create directory: " + parent.getAbsolutePath());
            }
        }

        // Create file if it doesn't exist
        if (!file.exists()) {
            file.createNewFile();
        }
    }

    // Add new user
    public void addUser(User user) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE, true))) {
            bw.write(user.getUsername() + "|" + user.getPassword());
            bw.newLine();
        }
    }

    // Get all users
    public List<User> getAllUsers() throws IOException {
        List<User> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = br.readLine()) != null && !line.trim().isEmpty()) {
                String[] data = line.split("\\|");
                User user = new User(data[0], data[1]);
                list.add(user);
            }
        }
        return list;
    }

    // Validate login
    public boolean validateUser(String username, String password) throws IOException {
        for (User user : getAllUsers()) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
