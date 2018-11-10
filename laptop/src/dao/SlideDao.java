package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Slide;

@Repository
public class SlideDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Slide> getItems() {
		String sql = "SELECT * FROM slide LIMIT 2";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}

	public int addItem(Slide objSlide) {
		String sql = "INSERT INTO slide(image) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {objSlide.getImage()});
	}

	public Slide getItem(int id) {
		String sql = "SELECT * FROM slide WHERE id_slide = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Slide>(Slide.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}

	public int editItem(Slide objSlide) {
		String sql = "UPDATE slide SET image = ? WHERE id_slide = ?";
		return jdbcTemplate.update(sql, new Object[] {objSlide.getImage(),objSlide.getId_slide()});
	}
}
