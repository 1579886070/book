package xyz.xioaxin12.service;

import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.MyLoginException;
import xyz.xioaxin12.exception.RegistException;

/**
 * @author 爱生活爱技术
 */
public interface UserService {

    void regitsUser(User user) throws RegistException;

    User loginUser(String name, String passsword) throws MyLoginException;
}
