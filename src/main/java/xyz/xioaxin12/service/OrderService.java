package xyz.xioaxin12.service;

import xyz.xioaxin12.annotation.PrivilegeInfo;
import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.OrderException;
import xyz.xioaxin12.exception.PrivilegeException;

import java.sql.SQLException;
import java.util.List;

public interface OrderService {
    void add(User user, Order order);
    @PrivilegeInfo("查看订单")
    List<Order> find(User user)throws PrivilegeException,SQLException;

    void delete(String id) throws OrderException;

    void updateState(String id) throws SQLException;
}
