package xyz.xioaxin12.utils;

import java.math.BigInteger;
import java.util.Random;

/**
 * @author 爱生活爱技术
 */
public class IdRandom {

    /**
     * 生成随机名
     *
     * @return
     */
    public static String getRandom() {
        return new BigInteger(165, new Random()).toString(36).toUpperCase();
    }

}
