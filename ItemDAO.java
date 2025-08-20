package dao;

import model.Item;
import java.io.*;
import java.util.*;
import java.nio.file.Paths;

public class ItemDAO {
    private String FILE;

    public ItemDAO(String basePath) {
        this.FILE = Paths.get(basePath, "items.txt").toString();
    }

    // Add new item
    public void addItem(Item item) throws IOException {
        File file = new File(FILE);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
        }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE, true))) {
            bw.write(item.toString());
            bw.newLine();
        }
    }

    // Get all items
    public List<Item> getAllItems() throws IOException {
        List<Item> list = new ArrayList<>();
        File file = new File(FILE);
        if (!file.exists()) return list;

        try (BufferedReader br = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = br.readLine()) != null && !line.trim().isEmpty()) {
                String[] data = line.split("\\|");
                Item item = new Item(
                        Integer.parseInt(data[0]),
                        data[1],
                        Double.parseDouble(data[2])
                );
                list.add(item);
            }
        }
        return list;
    }

    // Find item by ID
    public Item getItemById(int id) throws IOException {
        for (Item i : getAllItems()) {
            if (i.getId() == id) return i;
        }
        return null;
    }

    // Update item
    public boolean updateItem(Item updated) throws IOException {
        List<Item> items = getAllItems();
        boolean found = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE))) {
            for (Item i : items) {
                if (i.getId() == updated.getId()) {
                    i = updated;
                    found = true;
                }
                bw.write(i.toString());
                bw.newLine();
            }
        }
        return found;
    }

    // Delete item
    public boolean deleteItem(int id) throws IOException {
        List<Item> items = getAllItems();
        boolean removed = false;

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE))) {
            for (Item i : items) {
                if (i.getId() == id) {
                    removed = true;
                    continue;
                }
                bw.write(i.toString());
                bw.newLine();
            }
        }
        return removed;
    }
}
