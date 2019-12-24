package cn.wyu.dao;

import cn.wyu.pojo.FileUpload;
import cn.wyu.pojo.FileUploadExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FileUploadMapper {
    long countByExample(FileUploadExample example);

    int deleteByExample(FileUploadExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FileUpload record);

    int insertSelective(FileUpload record);

    List<FileUpload> selectByCondition(FileUpload fileUpload);

    List<FileUpload> selectByExample(FileUploadExample example);

    FileUpload selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FileUpload record, @Param("example") FileUploadExample example);

    int updateByExample(@Param("record") FileUpload record, @Param("example") FileUploadExample example);

    int updateByPrimaryKeySelective(FileUpload record);

    int updateByPrimaryKey(FileUpload record);
}