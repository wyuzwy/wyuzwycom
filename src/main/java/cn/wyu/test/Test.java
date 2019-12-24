package cn.wyu.test;





import cn.wyu.dao.EmployeeMapper;
import cn.wyu.dao.UserMapper;
import cn.wyu.pojo.Employee;
import cn.wyu.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Test {
    public static void main(String[] args) throws IOException {
        String config = "mybatis-config.xml";
        InputStream is = Resources.getResourceAsStream(config);
        SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
        SqlSession session = sf.openSession();
        //EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        //User user = mapper.selectById("1004");
//        User user = new User();
//        user.setNumber("1008");
//        user.setUsername("洪七公");
//        user.setPassword("123456");
//        user.setPhone("15766946398");
//        user.setStatus(2);
//        user.setRemark("他是个男人！");
//        //String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//        user.setCreatedate(new Date());
//        //mapper.insertUser(user);
//        //mapper.deleteById("1007");
//        mapper.insertSelective(user);
//        session.commit();
        //List<User> users = mapper.selectAll();
//        User users = mapper.selectByPrimaryKey("1008");
        //System.out.println(users.toString());
//        List<Employee> employees = mapper.selectByExample(null);
//        User user  = new User();
//
//
//        user.setStatus(0);
        Employee employee = new Employee();
        employee.setSex(0);
        employee.setDeptId(0);
        employee.setJobId(0);
        employee.setName("段");

        List<Employee> employees = mapper.selectWithExample(employee);
        System.out.println(employees.toString());
        session.close();
    }


}
