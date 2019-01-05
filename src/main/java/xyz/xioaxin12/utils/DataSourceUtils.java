package xyz.xioaxin12.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 工具类 提供数据库连接池和数据库连接
 *
 * @author 爱生活爱技术
 */
public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();
    /**
     * 创建多个线程
     */
    private static ThreadLocal<Connection> connectionThreadLocal = new ThreadLocal<>();

    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * 需要手动控制事物时，调用该方法获得一个链接
     *
     * @return
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        Connection connection = connectionThreadLocal.get();

        if (connection == null) {
            connection = dataSource.getConnection();
            connectionThreadLocal.set(connection);
        }
        return connection;
    }

    /**
     * 开启事务
     *
     * @throws SQLException
     */
    public static void startTransaction() throws SQLException {
        /**
         * 设置为手动开启事物
         */
        getConnection().setAutoCommit(false);
    }


    /**
     * 回滚事务
     *
     * @throws SQLException
     */
    public static void rollback() throws SQLException {
        getConnection().rollback();
    }

    /**
     * 事务提交
     *
     * @throws SQLException
     */
    public static void commitAndReleased() throws SQLException {

        // 事务提交
        getConnection().commit();
        // 释放connection，是将其放回到连接池.
        getConnection().close();
        connectionThreadLocal.remove();
    }

}
