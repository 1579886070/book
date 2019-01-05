package xyz.xioaxin12.domain;

import java.io.Serializable;

/**
 * 订单与商品的关系表
 * @author 爱生活爱技术
 */
public class OrderItem implements Serializable {

    /**
     * 订单号，商品号,数量
     */
    private String order_id;
    private String product_id;
    private int buynum;

    /**
     *  要查询订单中商品信息时，可以将商品信息封装到OrderItem中.
     */
    private String name;
    private double price;

    public OrderItem() {
    }

    public OrderItem(String order_id, String product_id, int buynum, String name, double price) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.buynum = buynum;
        this.name = name;
        this.price = price;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "order_id='" + order_id + '\'' +
                ", product_id='" + product_id + '\'' +
                ", buynum=" + buynum +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
