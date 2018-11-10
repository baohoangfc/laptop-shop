package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import entity.Order;
import entity.OrderDetail;

@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addItem(Order order) {
		String sql = "INSERT INTO orders(role_id,total,address,email,phone,date,id_payment) VALUES(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{3,order.getTotal(),order.getAddress(),order.getEmail(),order.getPhone(),order.getDate(),order.getId_payment()});
	}
	
	/*public long addItemTest(Order order) {
		String sql = "INSERT INTO orders(id_user,total,address,email,phone,date) VALUES(?,?,?,?,?,?)";
		// Will hold the ID of the row created by the insert
	    PreparedStatementCreator psc = new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, order.getId_user());
	            ps.setDouble(2, order.getTotal());
	            ps.setString(3, order.getAddress());
	            ps.setString(4, order.getEmail());
	            ps.setString(5, order.getPhone());
	            ps.setString(6, order.getDate());
				return ps;
			}
		};

		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(psc, keyHolder);
		
		order.setId_order((int) keyHolder.getKey().longValue() );
		return order.getId_order();
	}*/
	
	
	
	
	public int addItemAcc(Order order) {
		String sql = "INSERT INTO orders(role_id,total,address,email,phone,date) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{order.getRole_id(),order.getTotal(),order.getAddress(),order.getEmail(),order.getPhone(),order.getDate()});
	}
	
	public int getIdO(Order order) {
		String sql = "SELECT id_order FROM orders ORDER BY id_order DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public int addDetail(OrderDetail order) {
		String sql = "INSERT INTO ordersdetail(price,quantity,id_order,id_product) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{order.getPrice(),order.getQuantity(),order.getId_order(),order.getId_product()});
	}

	public Order getItem(int id_order) {
		String sql = "SELECT * FROM orders WHERE id_order = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_order}, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItems(int offset) {
		String sql = "SELECT orders.id_order,ordersdetail.id_product,email,total,address,phone,status,date,name_pay "
				+ " FROM `ordersdetail`"
				+ " INNER JOIN orders ON orders.id_order = ordersdetail.id_order "
				+ " INNER JOIN product ON product.id_product = ordersdetail.id_product"
				+ " INNER JOIN payment ON orders.id_payment = payment.id_payment"
				+ " ORDER BY orders.id_order DESC"
				+ " LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[]{offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Order>(Order.class));
	}

	public int countItem(){
		String sql = "SELECT COUNT(*) AS countNews"
				+ " FROM orders"
				+ " INNER JOIN ordersdetail"
				+ " ON ordersdetail.id_order = orders.id_order";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	
	
}
