package xyz.xioaxin12.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 爱生活爱技术
 */
public class OrderDaoImpl implements OrderDao {
    @Override
    public void createOrder(Order order) throws SQLException {
        String sql = "insert into orders values(?,?,?,?,0,null,?)";

        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getConnection(), sql, order.getId(),order.getBookname(),
                order.getMoney(), order.getReceiverinfo(), order.getUser_id());
    }

    /**
     * 根据用户查询订单
     * @param user
     * @return
     */
    @Override
    public List<Order> findOrder(User user) throws SQLException {
        String sql = null;
        List<Order> orders = null;
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        if("admin".equals(user.getRole())){
            sql = "select orders.*,name,nickname from orders,users where orders.user_id=users.id";
            orders = runner.query(sql,new BeanListHandler<Order>(Order.class));
        }else if("user".equals(user.getRole())){
            sql = "select orders.*,name,nickname from orders,users where orders.user_id=users.id and user_id=?";
            orders = runner.query(sql, new BeanListHandler<Order>(Order.class), user.getId());
        }

        return orders;
    }

    /**
     * 删除订单
     * @param id
     */
    @Override
    public void delOrder(String id) throws SQLException {
        String sql = "delete from orders where id=?";

        QueryRunner runner = new QueryRunner();

        runner.update(DataSourceUtils.getConnection(), sql, id);
    }

    /**
     * 修改订单状态
     * @param id
     * @throws SQLException
     */
    @Override
    public void updateState(String id) throws SQLException {
        String sql="update orders set paystate=1 where id=?";

        QueryRunner runner = new QueryRunner();

        runner.update(sql,id);

    }
}
