package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Guaranree;
import entity.Item;
import entity.Product;

@Repository
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Guaranree> getGuaranree(){
		String sql = "SELECT * FROM guaranree";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Guaranree>(Guaranree.class));
	}
	
	public List<Product> getItems(int offset){
		String sql = "SELECT id_product,name_product,price,price_sale,preview,details,id_status,production_code,date_create,id_categories,picture,id_guaranree,cname"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories"
				/*+ " INNER JOIN item"
				+ " ON product.id_product = item.id_product"*/
				+ " ORDER BY id_product DESC"
				+ " LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[]{offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public List<Product> getItemsByCid(int cid){
		String sql = "SELECT id_product,name_product,price,price_sale,preview,details,id_status,production_code,date_create,id_categories,picture,id_guaranree,cname"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories"
				/*+ " INNER JOIN item"
				+ " ON product.id_product = item.id_product"*/
				+ " WHERE categories.cid = ?"
				+ " ORDER BY id_product DESC";
		try {
			return jdbcTemplate.query(sql,new Object[]{cid},new BeanPropertyRowMapper<Product>(Product.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}
	
	public List<Product> getItems(){
		String sql ="SELECT id_product,name_product,price,price_sale,preview,details,id_status,production_code,date_create,id_categories,picture,id_guaranree,cname"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories"
				/*+ " INNER JOIN item"
				+ " ON product.id_product = item.id_product"*/
				+ " ORDER BY id_product DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public int countItem(){
		String sql = "SELECT COUNT(*) AS countNews"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}
	
	public int addItem(Product objProduct,int cid) {
		String sql = "INSERT INTO product(production_code,name_product,picture,price,id_categories,preview,details,id_guaranree,price_sale) VALUES(?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{objProduct.getProduction_code(),objProduct.getName_product(),objProduct.getPicture(),objProduct.getPrice(),cid,objProduct.getPreview(),objProduct.getDetails(),objProduct.getId_guaranree(),objProduct.getPrice_sale()});
	}

	public Product getItem(int id_product) {
		String sql = "SELECT product.id_product,product.name_product,price,price_sale,preview,details,id_status,production_code,date_create,id_categories,picture,id_guaranree,cname"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories"
				+ " INNER JOIN item"
				+ " ON product.id_product = item.id_product"
				+ " WHERE product.id_product = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{id_product},new BeanPropertyRowMapper<Product>(Product.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}
	
	
	public int editItem(Product obj) {
		String sql = "UPDATE product SET production_code = ?,name_product = ?,picture = ?,price = ?,id_categories = ?,preview = ?,details = ?,id_guaranree = ?,price_sale = ? WHERE id_product = ? ";
		return jdbcTemplate.update(sql,new Object[]{obj.getProduction_code(),obj.getName_product(),obj.getPicture(),obj.getPrice(),obj.getId_categories(),obj.getPreview(),obj.getDetails(),obj.getId_guaranree(),obj.getPrice_sale(),obj.getId_product()});
	}

	public int delItem(int id_product) {
		String sql = "DELETE FROM product WHERE id_product = ?";
		return jdbcTemplate.update(sql,new Object[]{id_product});
	}

	public Product getDetail(int idp) {
		String sql = "SELECT item.id_product,name_product,price,price_sale,preview,details,id_status,production_code,date_create,id_categories,picture,id_guaranree,cname"
				+ " FROM product"
				+ " INNER JOIN categories"
				+ " ON categories.cid = product.id_categories"
				+ " INNER JOIN item"
				+ " ON product.id_product = item.id_product"
				+ " WHERE item.id_product = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{idp},new BeanPropertyRowMapper<Product>(Product.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}

	public int addItem(Item id) {
		String sql = "INSERT INTO item(id_product,quantity) VALUES(?,1)";
		return jdbcTemplate.update(sql,new Object[]{id});
	}



}
