package cn.wyu.controller;

import cn.wyu.pojo.FileUpload;
import cn.wyu.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class FileUploadController {

    @Autowired
    private FileUploadService uploadFileService;



    /**
     * 上传文件，然后将文件的路径返回给前端，addFile才是真正的写进数据库
     * @param files
     * @param request
     * @return
     */
    @RequestMapping(value = "/addFile",method = RequestMethod.POST)
    @ResponseBody
    public Map upload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request){
        return uploadFileService.uploadFile(files,request);
    }

    @RequestMapping("/uploadFile")
    @ResponseBody
    public Map addFile(FileUpload fileUpload){
       return uploadFileService.addFile(fileUpload);
    }

    @RequestMapping("/findFile")
    @ResponseBody
    public Map findFile(FileUpload fileUpload,@RequestParam("page")String page,
                        @RequestParam("rows")String rows){
        return uploadFileService.findFile(fileUpload,page,rows);
    }


    @RequestMapping(value = "/deleteFile/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Map deleteFile(@PathVariable("id") Integer id){
        return uploadFileService.deleteFile(id);
    }

    @RequestMapping(value = "/downFile",method = RequestMethod.GET)
    public void downFile(@RequestParam("id")Integer id, HttpServletRequest request, HttpServletResponse response){
        uploadFileService.downFile(id,request,response);
    }
}
