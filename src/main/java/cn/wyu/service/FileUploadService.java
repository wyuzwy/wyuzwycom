package cn.wyu.service;

import cn.wyu.pojo.FileUpload;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public interface FileUploadService {

    Map<String,Object> uploadFile(MultipartFile[] files, HttpServletRequest request);

    Map<String,Object> addFile(FileUpload fileUpload);

    Map<String,Object> findFile(FileUpload fileUpload,String page,String rows);

    Map<String,Object> deleteFile(Integer id);

    void downFile(Integer id, HttpServletRequest request, HttpServletResponse response);

}
