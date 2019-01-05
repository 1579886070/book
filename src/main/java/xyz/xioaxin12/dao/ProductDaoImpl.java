package xyz.xioaxin12.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.OrderItem;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;


public class ProductDaoImpl implements ProductDao {

    private QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());

    /**
     * 添加商品
     * @param product
     * @throws SQLException
     */
    @Override
    public void addProducts(Product product) throws SQLException {
        String sql = "insert into products values(?,?,?,?,?,?,?)";
        queryRunner.update(sql,product.getId(),product.getName(),product.getPrice(),product.getCategory(),product.getPnum(),
                                product.getImgurl(),product.getDescription());
    }

    /**
     * 查询所有商品
     * @return
     * @throws SQLException
     */
    @Override
    public List<Product> findAll() throws SQLException {
        String sql = "select * from products";
        return queryRunner.query(sql,new BeanListHandler<Product>(Product.class));
    }

    /**
     * 根据id查询
     * @param id
     * @return
     * @throws SQLException
     */
    @Override
    public Product findById(String id) throws SQLException {
        String sql = "select * from products where id=?";
        return queryRunner.query(sql,new BeanHandler<Product>(Product.class),id);
    }

    /**
     * 修改商品數量
     * @param order
     */
    @Override
    public void updateProductCount(Order order) throws SQLException {
        List<OrderItem> items = order.getOrderItems();

        Object[][] params = new Object[items.size()][2];

        for(int i = 0;i < items.size();i++){
            OrderItem item = items.get(i);

            params[i][0] = item.getBuynum();
            params[i][1] = item.getProduct_id();
        }

        String sql = "update products set pnum=pnum-? where id=?";
        QueryRunner runner = new QueryRunner();
        runner.batch(DataSourceUtils.getConnection(),sql,params);
    }

    /**
     * 删除订单时,修改商品数量
     * @param items
     * @throws SQLException
     */
    @Override
    public void updateProductCount(List<OrderItem> items) throws SQLException {
        Object[][] params = new Object[items.size()][2];

        for (int i = 0; i < items.size(); i++) {

            OrderItem item = items.get(i);
            params[i][0] = item.getBuynum();
            params[i][1] = item.getProduct_id();

        }

        String sql = "update products set pnum=pnum+? where id=?";

        QueryRunner runner = new QueryRunner();

        runner.batch(DataSourceUtils.getConnection(), sql, params);
    }

    /**
     * 根据商品id删除商品
     * @param id
     */
    @Override
    public void deleteByIdProduct(String id) throws SQLException {
        String sql = "delete from products where id=?";
        queryRunner.update(sql,id);
    }
}
