package xyz.xioaxin12.dao;

import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.OrderItem;

import java.sql.SQLException;
import java.util.List;

public interface OrderItemDao {
    void addOrderItem(Order order) throws SQLException;

    List<OrderItem> findOrderItemByOrderId(Order order) throws SQLException;

    List<OrderItem> findOrderItemByOrderId(String id) throws SQLException;

    void delOrderItem(String id) throws SQLException;
}
