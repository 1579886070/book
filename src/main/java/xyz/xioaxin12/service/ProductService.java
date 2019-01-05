package xyz.xioaxin12.service;

import xyz.xioaxin12.annotation.PrivilegeInfo;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.PrivilegeException;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 爱生活爱技术
 */
public interface ProductService {

    /**
     * 添加商品
     * @param user
     * @param product
     * @throws SQLException
     */
    @PrivilegeInfo("添加图书")
    void addProduct(User user, Product product) throws PrivilegeException,SQLException;

    /**
     * 查询所有商品信息
     * @return
     * @throws SQLException
     */
    List<Product> findAll() throws SQLException;

    /**
     * 根据id查询所有信息
     * @param id
     * @return
     * @throws SQLException
     */
    Product findById(String id) throws SQLException;

    /**
     * 根据id删除商品
     * @param id
     */
    void delete(String id) throws SQLException;


    /**
     * 查询所有商品
     * @return
     */
    @PrivilegeInfo("删除图书")
    List<Product> findAlldel(User user) throws PrivilegeException,SQLException;
}
