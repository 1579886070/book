package xyz.xioaxin12.service.impl;

import xyz.xioaxin12.dao.UserDao;
import xyz.xioaxin12.dao.UserDaoImpl;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.MyLoginException;
import xyz.xioaxin12.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();

    @Override
    public void regitsUser(User user) {
        try{
            dao.addUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public User loginUser(String name, String passsword) throws MyLoginException {
        User user = null;
        try{
            user = dao.findUserByNameAndPassword(name,passsword);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

}
