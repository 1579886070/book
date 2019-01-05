package xyz.xioaxin12.dao;

import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.OrderItem;
import xyz.xioaxin12.domain.Product;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 爱生活爱技术
 */
public interface ProductDao {
    void addProducts(Product product) throws SQLException;

    List<Product> findAll() throws SQLException;

    Product findById(String id) throws SQLException;

    void updateProductCount(Order order) throws SQLException;

    void updateProductCount(List<OrderItem> items) throws SQLException;

    void deleteByIdProduct(String id) throws SQLException;
}
