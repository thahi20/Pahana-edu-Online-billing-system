package model;

public class Customer {
    private int accountNo;
    private String name;
    private String address;
    private String phone;
    private int units;

    public Customer(int accountNo, String name, String address, String phone, int units) {
        this.accountNo = accountNo;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.units = units;
    }

    // Getters & Setters
    public int getAccountNo() { return accountNo; }
    public void setAccountNo(int accountNo) { this.accountNo = accountNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public int getUnits() { return units; }
    public void setUnits(int units) { this.units = units; }

    @Override
    public String toString() {
        return accountNo + "|" + name + "|" + address + "|" + phone + "|" + units;
    }
}
