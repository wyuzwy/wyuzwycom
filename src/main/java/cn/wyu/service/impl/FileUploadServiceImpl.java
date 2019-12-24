package cn.wyu.service.impl;

import cn.wyu.dao.FileUploadMapper;
import cn.wyu.pojo.FileUpload;
import cn.wyu.service.FileUploadService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Autowired
    private FileUploadMapper fileUploadMapper;


    @Override
    public Map<String, Object> uploadFile(MultipartFile[] files, HttpServletRequest request) {
        Map<String ,Object> map = new HashMap<>();
        StringBuilder url = new StringBuilder();
        try {
            int i=0;
            if(files.length!=0) {
                for (MultipartFile file : files) {
                    String fileName = file.getOriginalFilename();
                    System.out.println(fileName);
                    String saveName = UUID.randomUUID().toString().replace("-", "").substring(0,5) + fileName;
                    String savedPath = request.getServletContext().getRealPath("/") + "uploadFiles/";
                    String saveUrl  = request.getContextPath() + "/uploadFiles/";

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
                    String ymd = sdf.format(new Date());
                    savedPath += ymd + "/";
                    saveUrl += ymd + "/";


                    File saveDir = new File(savedPath);
                    if (!saveDir.exists()) {
                        saveDir.mkdirs();
                    }
                    File saveFile = new File(savedPath, saveName);
                    if (i!=0) {
                        url.append(",");
                    }
                    //System.out.println(saveFile);
                    url.append(saveUrl);
                    url.append(saveName);
                    file.transferTo(saveFile);
                    i++;
                }
                //System.out.println(i);
            }
            if(i!=0) {
                map.put("url", url.toString());
                map.put("flag", "200");
                return map;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        map.put("flag","100");
        return map;
    }

    @Override
    public Map<String, Object> addFile(FileUpload fileUpload) {
        Map<String,Object> map = new HashMap<>();
        Date time = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String date = format.format(time);
        fileUpload.setCreatedate(date);
//        System.out.println(fileUpload.toString());
        int flag=fileUploadMapper.insertSelective(fileUpload);
        if(flag>0) {
            map.put("flag", "200");
        }else{
            map.put("flag", "100");
        }
        return map;
    }

    @Override
    public Map<String, Object> findFile(FileUpload fileUpload,String page,String rows) {
        Map<String,Object> map = new HashMap<>();
        PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
        List<FileUpload> lists = fileUploadMapper.selectByCondition(fileUpload);
        PageInfo pageInfo = new PageInfo(lists,Integer.parseInt(page));
        map.put("rows",lists);
        map.put("total",pageInfo.getTotal());
        return map;
    }

    @Override
    public Map<String, Object> deleteFile(Integer id) {
        Map<String,Object> map = new HashMap<>();
        String path = fileUploadMapper.selectByPrimaryKey(id).getUrl();
        int flag = fileUploadMapper.deleteByPrimaryKey(id);
        if(flag>0){
            delete(path);
            map.put("flag","200");
        }else{
            map.put("flag","100");
        }
        return map;
    }



    public void delete(String path){
        String[] paths = path.split(",");
        String readPath="F:\\JAVA项目\\wyuzwycom\\target\\wyuzwy.com";
        for(String p : paths){
            p=readPath+p;
//            System.out.println("获取到路径了："+p);
            File file = new File(p);
            if(file.exists()){
               file.delete();
            }
        }
    }


    /**
     * 文件下载
     * @param id
     * @param request
     * @param response
     */
    @Override
    public void  downFile(Integer id,HttpServletRequest request, HttpServletResponse response) {
        String zipFilePath=null;
        try {
        String path = fileUploadMapper.selectByPrimaryKey(id).getUrl();
        String[] paths = path.split(",");
        List<String> files = new ArrayList<>();
        String basePath="F:\\JAVA项目\\wyuzwycom\\target\\wyuzwy.com";
        for(String p : paths){
            p=basePath+p;
//            File file = new File(p);
            files.add(p);
        }

        //IO流实现下载的功能
        response.setCharacterEncoding("UTF-8");//设置编码符号
        response.setContentType("application/octet-stream;charset=UTF-8");//设置下载内容类型
        OutputStream out = response.getOutputStream();//创建页面返回方式为输出流，会自动弹出下载框


        //创建压缩文件需要的空的zip包
        String zipBasePath = request.getSession().getServletContext().getRealPath("/uploadFiles/zip");
        String zipName = "downLoad.zip";
        zipFilePath=zipBasePath+File.separator+zipName;

        //压缩文件
        File zip = new File(zipFilePath);
        if(!zip.exists()){
            zip.createNewFile();
        }

        //创建zip的文件输出流
            ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zip));
            this.zipFile(zipBasePath,zipName,zipFilePath,files,zos);
            zos.close();
            //设置下载的压缩文件名称
            response.setHeader("Content-disposition","attachment;filename="+zipName);

            //将打包后的文件写到客户端，输出的方法同上，使用缓冲流输出
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(zipFilePath));
            byte[] buff = new byte[bis.available()];
            bis.read(buff);
            bis.close();
            out.write(buff);//输出数据文件
            out.flush();//释放缓存
            out.close();//关闭输出流





        } catch (IOException e) {
            e.printStackTrace();
            //response.reset();

        }finally {
            File file = new File(zipFilePath);
            if(file.exists()){
                file.delete();
            }
        }
    }

    /**
     * 压缩文件
     * @param zipBasePath 临时压缩文件基础路径
     * @param zipName   临时压缩文件名称
     * @param zipFilePath   临时压缩文件完整路径
     * @param filePaths 需要压缩的文件路径集合
     * @param zos
     * @return
     */
    private String zipFile(String zipBasePath,String zipName,String zipFilePath,List<String> filePaths,ZipOutputStream zos) throws IOException {
//    private String zipFile(List<String> filePaths,ZipOutputStream zos) throws IOException {
        //循环解读文件路径集合，获取每一个文件的路径
        for(String filePath : filePaths){
            File inputFile = new File(filePath);
            if(inputFile.exists()){
                //创建输入流读取文件
                BufferedInputStream bis = new BufferedInputStream(new FileInputStream(inputFile));
                //将文件写入zip内，即将文件进行打包
                zos.putNextEntry(new ZipEntry(inputFile.getName()));

                //写入文件的方法
                int size = 0;
                byte[] buffer = new byte[bis.available()];//设置读取数据缓存大小
                while ((size=bis.read(buffer))>0){
                    zos.write(buffer,0,size);
                }
                //关闭输入输出流
                zos.closeEntry();
                bis.close();
            }
        }
        return null;
    }
}
