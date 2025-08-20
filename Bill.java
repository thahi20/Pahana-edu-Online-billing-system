package model;

public class Bill {
    private int billId;
    private int accountNo;
    private double total;

    public Bill(int billId, int accountNo, double total) {
        this.billId = billId;
        this.accountNo = accountNo;
        this.total = total;
    }

    // Getters & Setters
    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public int getAccountNo() { return accountNo; }
    public void setAccountNo(int accountNo) { this.accountNo = accountNo; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    @Override
    public String toString() {
        return billId + "|" + accountNo + "|" + total;
    }
}
