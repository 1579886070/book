package xyz.xioaxin12.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.utils.DataSourceUtils;
import xyz.xioaxin12.utils.Md5Utils;

import java.sql.SQLException;

/**
 * @author 爱生活爱技术
 */
public class UserDaoImpl implements UserDao {

    private QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    /**
     * 注册用户
     * @param user
     * @throws SQLException
     */
    @Override
    public void addUser(User user) throws SQLException {
        //Sql语句
        String sql = "insert into users values(?,?,?,?,?,'user')";
        queryRunner.update(sql,user.getId(),user.getName(),Md5Utils.getMd5(user.getPassword()),
                            user.getNickname(),user.getEmail());
    }

    /**
     * 登陆校对
     * @param name
     * @param passsword
     */
    @Override
    public User findUserByNameAndPassword(String name, String passsword) throws SQLException {
        String sql="select * from users where name=? and password=?";
        User user = queryRunner.query(sql, new BeanHandler<User>(User.class),name,Md5Utils.getMd5(passsword));
        return user;
    }
}
