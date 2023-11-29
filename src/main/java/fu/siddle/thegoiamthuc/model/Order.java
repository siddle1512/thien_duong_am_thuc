package fu.siddle.thegoiamthuc.model;

public class Order {

    private int id;
    private int user_id;
    private double total_price;
    private String payment;
    private String status;

    public Order() {
    }

    public Order(int id) {
        this.id = id;
    }

    public Order(int user_id, double total_price, String payment, String status) {
        this.user_id = user_id;
        this.total_price = total_price;
        this.payment = payment;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
