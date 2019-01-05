package xyz.xioaxin12.utils;

import java.util.UUID;

public class UploadUtils {
    public static String subFileName(String fileName) {
        //查找最后一个\出现的位置
        int index = fileName.lastIndexOf("\\");
        if (index == -1) {
            return fileName;
        }
        return fileName.substring(index + 1);
    }

    public static String getRandomFileName(String fileName) {
        //获得拓展名
        String ext = fileName.substring(fileName.lastIndexOf("."));
        return UUID.randomUUID().toString()+ext;
    }

    public static String getRandomDir(String uuidFileName) {
        int hashCode = uuidFileName.hashCode();
        // 一级目录
        int d1 = hashCode & 0xf;
        // 二级目录
        int d2 = (hashCode >> 4) & 0xf;
        return "/" + d1 + "/" + d2;
    }
}
