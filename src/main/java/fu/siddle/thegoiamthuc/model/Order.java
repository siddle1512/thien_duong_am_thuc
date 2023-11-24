
package fu.siddle.thegoiamthuc.model;


public class Order {
    
    String username;
    int totalPrice;
    String payment;
    String status;

    public Order() {
    }

    public Order(String username, int totalPrice, String payment, String status) {
        this.username = username;
        this.totalPrice = totalPrice;
        this.payment = payment;
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
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

    @Override
    public String toString() {
        return "Order{" + "username=" + username + ", totalPrice=" + totalPrice + ", payment=" + payment + ", status=" + status + '}';
    }
    
}
