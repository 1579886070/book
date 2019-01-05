package xyz.xioaxin12.service.impl;

import xyz.xioaxin12.dao.*;
import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.OrderItem;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.OrderException;
import xyz.xioaxin12.service.OrderService;
import xyz.xioaxin12.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao dao = new OrderDaoImpl();
    private OrderItemDao idao = new OrderItemDaoImpl();
    ProductDao pdao = new ProductDaoImpl();

    @Override
    public void add(User user, Order order) {
        try {
            // 开启事务
            DataSourceUtils.startTransaction();
            // 1.向orders表中添加数据
            dao.createOrder(order);
            // 2.向orderitem表中添加数据
            idao.addOrderItem(order);
            // 3.修改products表中数据
            pdao.updateProductCount(order);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                //事务回滚
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            {
                try {
                    //事务提交
                    DataSourceUtils.commitAndReleased();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    /**
     * 根据用户查找订单
     * @param user
     * @return
     */
    @Override
    public List<Order> find(User user) throws SQLException {
        //查询订单消息
        List<Order> orders = dao.findOrder(user);

        for(Order order : orders){
            List<OrderItem> items = idao.findOrderItemByOrderId(order);
            order.setOrderItems(items);
        }
        return orders;
    }

    @Override
    public void delete(String id) throws OrderException {
        try {
            //开启事务
            DataSourceUtils.startTransaction();
            // 1.1 得到商品的数量
            List<OrderItem> items = idao.findOrderItemByOrderId(id);
            // 1.2修改商品的数量
            pdao.updateProductCount(items);
            // 2.删除订单项
            idao.delOrderItem(id);
            // 3.删除订单
            dao.delOrder(id);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            throw new OrderException("订单删除失败");
        }
        finally {
            try {
                //提交事务
                DataSourceUtils.commitAndReleased();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ;
        }
    }

    /**
     * 根据订单号修改订单信息
     * @param id
     */
    @Override
    public void updateState(String id) throws SQLException {
        dao.updateState(id);
    }
}
