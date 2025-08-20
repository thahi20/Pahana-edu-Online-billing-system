package dao;

import model.Customer;
import java.io.*;
import java.util.*;

public class CustomerDAO {
    private final String FILE;

    // Constructor accepts folder path
    public CustomerDAO(String dataDir) throws IOException {
        FILE = dataDir + File.separator + "customers.txt";

        File file = new File(FILE);
        File parent = file.getParentFile();

        // Create the "data" folder if it doesn't exist
        if (!parent.exists()) {
            if (!parent.mkdirs()) {
                throw new IOException("Failed to create directory: " + parent.getAbsolutePath());
            }
        }

        // Create the file if it doesn't exist
        if (!file.exists()) {
            file.createNewFile();
        }
    }

    // Add a new customer
    public void addCustomer(Customer c) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE, true))) {
            bw.write(c.getAccountNo() + "|" + c.getName() + "|" + c.getAddress() + "|" +
                     c.getPhone() + "|" + c.getUnits());
            bw.newLine();
        }
    }

    // Get all customers
    public List<Customer> getAllCustomers() throws IOException {
        List<Customer> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = br.readLine()) != null && !line.trim().isEmpty()) {
                String[] data = line.split("\\|");
                Customer c = new Customer(
                        Integer.parseInt(data[0]),
                        data[1], data[2], data[3],
                        Integer.parseInt(data[4])
                );
                list.add(c);
            }
        }
        return list;
    }

    // Get customer by account number
    public Customer getCustomerById(int accountNo) throws IOException {
        for (Customer c : getAllCustomers()) {
            if (c.getAccountNo() == accountNo) return c;
        }
        return null;
    }

    // Update customer
    public boolean updateCustomer(Customer updated) throws IOException {
        List<Customer> customers = getAllCustomers();
        boolean found = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE))) {
            for (Customer c : customers) {
                if (c.getAccountNo() == updated.getAccountNo()) {
                    c = updated;
                    found = true;
                }
                bw.write(c.getAccountNo() + "|" + c.getName() + "|" + c.getAddress() + "|" +
                         c.getPhone() + "|" + c.getUnits());
                bw.newLine();
            }
        }
        return found;
    }

    // Delete customer
    public boolean deleteCustomer(int accountNo) throws IOException {
        List<Customer> customers = getAllCustomers();
        boolean removed = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE))) {
            for (Customer c : customers) {
                if (c.getAccountNo() == accountNo) {
                    removed = true;
                    continue;
                }
                bw.write(c.getAccountNo() + "|" + c.getName() + "|" + c.getAddress() + "|" +
                         c.getPhone() + "|" + c.getUnits());
                bw.newLine();
            }
        }
        return removed;
    }
    
    
}



