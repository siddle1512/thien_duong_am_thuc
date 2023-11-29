package fu.siddle.thegoiamthuc.model;

import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityByid(int id) {
        return getItemById(id).getQuantity();
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getFooditem().getId() == id) {
                return i;
            }
        }
        return null;
    }

    //---xu li trong cart---
    // them 1 item vao cart
    public void addItem(Item t) {
        if (getItemById(t.getFooditem().getId()) != null) {
            Item m = getItemById(t.getFooditem().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    // xoa item trong cart
    public void removeitem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    // tinh tong tien trong cart
    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    private Fooditem getFooditemById(int id) {
        String a = String.valueOf(id);
        List<Fooditem> list = FooditemDAO.getInstance().getFid(a);
        return list.get(0);
    }

    public Cart(String txt) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {

                // lay ra cac item trong cart cookie Cookie[] = txt[id:quantity],[txt[+:_], txt[_:_]...
                String[] s = txt.split(",");

                for (String i : s) {
                    //lay ra id : quantity
                    String[] n = i.split(":");

                    //lay cac du lieu cho cart
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Fooditem f = getFooditemById(id);

                    //tra ve item cho gio hang
                    Item t = new Item(f, quantity, f.price);

                    //them vao gio hang
                    addItem(t);
                }
            }
        } catch (Exception e) {

        }
    }

    public void remove() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
