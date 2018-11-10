package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Payment;

@Repository
public class PaymentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Payment> getItems() {
		String sql = "SELECT * FROM payment";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Payment>(Payment.class));
	}
}
