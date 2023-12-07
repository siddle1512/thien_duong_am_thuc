package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Cart;
import fu.siddle.thegoiamthuc.model.Item;
import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.Order_data;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
import fu.siddle.thegoiamthuc.model.dao.Order_dataDAO;
import fu.siddle.thegoiamthuc.service.VNPayConfig;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "checkoutcontroller", urlPatterns = {"/checkoutcontroller"})
public class checkoutcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        //lay car
        Object o = session.getAttribute("cart");

        Cart cart = null;

        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        List<User> listU = (List<User>) session.getAttribute("listuserlogin");

        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());

        RequestDispatcher rd = request.getRequestDispatcher("views/web/paymentdetail.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();

        String payment = request.getParameter("payment");

        List<User> lisU = (List<User>) session.getAttribute("listuserlogin");

        Cart cart = null;

        Object o = session.getAttribute("cart");

        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        List<Item> listI = cart.getItems();

        int total = 0;
        for (Item t : listI) {
            total += (t.getPrice() * t.getQuantity());
        }

        if (payment.equalsIgnoreCase("Vnpay")) {
            handleVNPayCheckout(request, response, total);

        } else {
            OrderDAO.getInstance().insert(new Order(lisU.get(0).getId(), total, payment, "done"));

            List<Order> lastOrder = OrderDAO.getInstance().getLast();

            int lastId = lastOrder.get(0).getId();

            for (Item t : listI) {
                Order_dataDAO.getInstance().insert(new Order_data(lastId, t.getFooditem().getId(), t.getQuantity()));
            }

            session.removeAttribute("size");
            session.removeAttribute("cart");

            RequestDispatcher rd = request.getRequestDispatcher("views/web/index.jsp");
            rd.forward(request, response);
        }

    }

    private static void handleVNPayCheckout(HttpServletRequest request, HttpServletResponse response, int totalPrice)
            throws UnsupportedEncodingException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = "TDAT - Thanh toán đơn hàng";
        String orderType = "other";
        String vnp_TxnRef = VNPayConfig.getRandomNumber(8);
        String vnp_IpAddr = VNPayConfig.getIpAddress(request);
        String vnp_TmnCode = VNPayConfig.vnp_TmnCode;

        Map vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(totalPrice * 100));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", "");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", getDomainWithPortAndContextPath(request) + VNPayConfig.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();

        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);

            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }

        String queryUrl = query.toString();
        String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;

        response.sendRedirect(paymentUrl);
    }

    private static String getDomainWithPortAndContextPath(HttpServletRequest request)
            throws MalformedURLException {
        return "http://" + new URL(request.getRequestURL().toString()).getHost() + ":" + request.getServerPort() + "/thienduongamthuc/";
    }

}
