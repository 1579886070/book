package xyz.xioaxin12.dao;

import xyz.xioaxin12.domain.User;

import java.sql.SQLException;

public interface UserDao {
    void addUser(User user) throws SQLException;

    User findUserByNameAndPassword(String name, String passsword) throws SQLException;
}
