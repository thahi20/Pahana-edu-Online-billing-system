package dao;

import model.Bill;
import java.io.*;
import java.util.*;

public class BillDAO {
    private final String FILE;

    public BillDAO(String dataDir) throws IOException {
        FILE = dataDir + File.separator + "bills.txt";
        File file = new File(FILE);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
        }
    }

    public void addBill(Bill bill) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE, true))) {
            bw.write(bill.toString());
            bw.newLine();
        }
    }

    public List<Bill> getAllBills() throws IOException {
        List<Bill> list = new ArrayList<>();
        File file = new File(FILE);
        if (!file.exists()) return list;

        try (BufferedReader br = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = br.readLine()) != null && !line.trim().isEmpty()) {
                String[] data = line.split("\\|");
                Bill b = new Bill(
                        Integer.parseInt(data[0]),
                        Integer.parseInt(data[1]),
                        Double.parseDouble(data[2])
                );
                list.add(b);
            }
        }
        return list;
    }
}

