package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Categories;

@Repository
public class CategoriesDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Categories> getItems() {
		String sql = "SELECT cid,cname,id_parent FROM categories";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Categories>(Categories.class));
	}
	
	public List<Categories> listCatAdd(){
		String sql = "SELECT cid,cname,id_parent FROM categories WHERE id_parent = 0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Categories>(Categories.class));
	}
	
	@SuppressWarnings("unused")
	public boolean checkName(Categories cat) {
		String sql = "SELECT * FROM categories WHERE cname = ?";
		try {
			Categories obj = (Categories)jdbcTemplate.queryForObject(sql, new Object[]{cat.getCname()},new BeanPropertyRowMapper<Categories>(Categories.class));
		} catch (EmptyResultDataAccessException e) {
			return true;
		}
		return false;
	}
	
	public int addItem(String cname,int cid){
		String sql = "INSERT INTO categories(cname,id_parent) VALUES(?,?)";
		return jdbcTemplate.update(sql,new Object[]{cname,cid});
	}
	
	public int delItem(int id){
		String sql = "DELETE FROM categories WHERE cid = ?";
		return jdbcTemplate.update(sql,new Object[]{id});
	}
	
	public Categories getItem(int id) {
		String sql = "SELECT *  FROM categories WHERE cid = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Categories>(Categories.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}
	
	public int editItem(Categories cat,int id_parent,int cid) {
		String sql = "UPDATE categories SET cname = ? ,id_parent = ? WHERE cid = ?";
		return jdbcTemplate.update(sql,new Object[]{cat.getCname(),id_parent,cid});
	}


	
	
	
	
}
