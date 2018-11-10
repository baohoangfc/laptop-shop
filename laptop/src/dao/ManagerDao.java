package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Manager;
import entity.Role;

@Repository
public class ManagerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Manager> getItems(int offset) {
		String sql = "SELECT mid,username,fullname,manager.role_id,role_name FROM manager "
				+ " INNER JOIN role"
				+ " ON manager.role_id = role.role_id"
				+ " LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[]{offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Manager>(Manager.class));
	}
	
	public List<Role> getItemRole(){
		String sql = "SELECT * FROM role";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Role>(Role.class));
	}
	
	public Manager getItem(int id) {
		String sql = "SELECT * FROM manager WHERE mid = ? ";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Manager>(Manager.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public Manager getItem() {
		String sql = "SELECT * FROM manager";
		return jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<Manager>(Manager.class));
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countUser FROM manager";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int addItem(Manager objUser) {
		String sql = "INSERT INTO manager(username,password,fullname,role_id) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{objUser.getUsername(),objUser.getPassword(),objUser.getFullname(),objUser.getRole_id()});
	}
	
	public int addUser(Manager objUser) {
		String sql = "INSERT INTO manager(username,password,fullname,email,phone,address,role_id) VALUES(?,?,?,?,?,3)";
		return jdbcTemplate.update(sql,new Object[]{objUser.getUsername(),objUser.getPassword(),objUser.getFullname(),objUser.getUsername(),objUser.getPhone(),objUser.getAddress()});
	}
	
	public Manager getItemByUsername(String name) {
		String sql = "SELECT * FROM manager WHERE username = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { name }, new BeanPropertyRowMapper<Manager>(Manager.class));
		} catch (NullPointerException e) {
			return null;
		}
	}

	public int editItem(Manager user) {
		String sql = "UPDATE manager SET password = ?,fullname = ? WHERE mid = ?";
		return jdbcTemplate.update(sql,new Object[]{user.getPassword(),user.getFullname(),user.getMid()});
	}

	public int delItem(int mid) {
		String sql = "DELETE FROM manager WHERE mid = ?";
		return jdbcTemplate.update(sql,new Object[]{mid});
	}
	
	
}
