package xyz.xioaxin12.service.impl;

import xyz.xioaxin12.dao.ProductDao;
import xyz.xioaxin12.dao.ProductDaoImpl;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.PrivilegeException;
import xyz.xioaxin12.service.ProductService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 爱生活爱技术
 */
public class ProductServiceImpl implements ProductService {
    private ProductDao dao = new ProductDaoImpl();
    @Override
    public void addProduct(User user, Product product) throws SQLException {
        dao.addProducts(product);
    }

    @Override
    public List<Product> findAll() throws SQLException {
        return dao.findAll();
    }

    @Override
    public Product findById(String id) throws SQLException {
        return dao.findById(id);
    }

    @Override
    public void delete(String id)  {
        try {
            dao.deleteByIdProduct(id);
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    @Override
    public List<Product> findAlldel(User user) throws PrivilegeException, SQLException {
        return dao.findAll();
    }
}
