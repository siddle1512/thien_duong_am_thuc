package fu.siddle.thegoiamthuc.model;

public class Order {

    private int id;

    //hien thi them
    private String username;

    private int user_id;
    private int total_price;
    private String payment;
    private String status;
    private String start_date;

    public Order() {
    }

    public Order(int id) {
        this.id = id;
    }

    //hien thi them
    public Order(int id, String username, int user_id, int total_price, String payment, String status, String start_date) {
        this.id = id;
        this.username = username;
        this.user_id = user_id;
        this.total_price = total_price;
        this.payment = payment;
        this.status = status;
        this.start_date = start_date;
    }

    public Order(int id, int user_id, int total_price, String payment, String status, String start_date) {
        this.id = id;
        this.user_id = user_id;
        this.total_price = total_price;
        this.payment = payment;
        this.status = status;
        this.start_date = start_date;
    }

    public Order(int id, int user_id, int total_price, String payment, String status) {
        this.id = id;
        this.user_id = user_id;
        this.total_price = total_price;
        this.payment = payment;
        this.status = status;
    }

    public Order(int user_id, int total_price, String payment, String status) {
        this.user_id = user_id;
        this.total_price = total_price;
        this.payment = payment;
        this.status = status;
    }

    public Order(int id, String status) {
        this.id = id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
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

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

}
