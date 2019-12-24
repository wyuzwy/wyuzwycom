package cn.wyu.service.impl;

import cn.wyu.dao.RoleMapper;
import cn.wyu.pojo.Role;
import cn.wyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Role> findAllRole() {
        List<Role> roles = new ArrayList<>();
        Role role = new Role();
        role.setId(0);
        role.setName("请选择...");
        roles.add(role);
        List<Role> roleList = roleMapper.selectByExample(null);
        roles.addAll(roleList);
        return roles;
    }
}
