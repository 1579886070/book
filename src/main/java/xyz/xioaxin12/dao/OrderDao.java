package xyz.xioaxin12.dao;

import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {
    void createOrder(Order order) throws SQLException;

    List<Order> findOrder(User user) throws SQLException;

    void delOrder(String id) throws SQLException;

    void updateState(String id) throws SQLException;
}
