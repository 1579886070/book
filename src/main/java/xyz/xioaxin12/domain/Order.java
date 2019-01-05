package xyz.xioaxin12.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author 爱生活爱技术
 */
public class Order implements Serializable {

    /**
     * id，价格,地址,支付状态,时间
     */
    private String id;

    private String bookname;

    private double money;

    private String receiverinfo;

    private int paystate;

    private Date orderTime;

    private String user_id;

    /**
     * 用于订单查询时，可以将用户信息也封装到Order中
      */
    private String name;
    private String nickname;

    /**
     * 订单中包含多个订单项
     */
    private List<OrderItem> orderItems;

    public Order() {
    }

    public Order(String id, String bookname, double money, String receiverinfo, int paystate, Date orderTime, String user_id, String name, String nickname, List<OrderItem> orderItems) {
        this.id = id;
        this.bookname = bookname;
        this.money = money;
        this.receiverinfo = receiverinfo;
        this.paystate = paystate;
        this.orderTime = orderTime;
        this.user_id = user_id;
        this.name = name;
        this.nickname = nickname;
        this.orderItems = orderItems;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getReceiverinfo() {
        return receiverinfo;
    }

    public void setReceiverinfo(String receiverinfo) {
        this.receiverinfo = receiverinfo;
    }

    public int getPaystate() {
        return paystate;
    }

    public void setPaystate(int paystate) {
        this.paystate = paystate;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", bookname='" + bookname + '\'' +
                ", money=" + money +
                ", receiverinfo='" + receiverinfo + '\'' +
                ", paystate=" + paystate +
                ", orderTime=" + orderTime +
                ", user_id='" + user_id + '\'' +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                ", orderItems=" + orderItems +
                '}';
    }
}
