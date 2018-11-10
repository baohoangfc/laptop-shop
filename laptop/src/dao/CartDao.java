package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Item;
@Repository
public class CartDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public Item getItem(int id) {
		String sql = "SELECT * FROM item WHERE id_product = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Item>(Item.class)); 
	}
}
