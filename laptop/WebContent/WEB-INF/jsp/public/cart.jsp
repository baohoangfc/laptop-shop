<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %> 
<form action="${pageContext.request.contextPath }/cart/update" method="get">
<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">

	<div class="table-responsive">
	
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="cart-romove item">Remove</th>
					<th class="cart-description item">Image</th>
					<th class="cart-product-name item">Product Name</th>
					<th class="cart-qty item">Quantity</th>
					<th class="cart-sub-total item">Subtotal</th>
					<th class="cart-total last-item">Grandtotal</th>
				</tr>
			</thead><!-- /thead -->
			<tfoot>
				<tr>
					<td colspan="7">
						<div class="shopping-cart-btn">
							<span class="">
								<a href="${pageContext.request.contextPath }/" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
								<input class="btn btn-upper btn-primary pull-right outer-right-xs" type="submit" value="Update shopping cart">
							</span>
						</div><!-- /.shopping-cart-btn -->
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${sessionScope.cart }" var="item" varStatus="i">
				<c:set var="s" value="${s + item.price * item.quantity }" ></c:set>
				<tr>
					<td class="romove-item"><a href="${pageContext.request.contextPath }/cart/del/${i.index}" title="cancel" class="icon"><i class="fa fa-trash-o"></i></a></td>
					<td class="cart-image">
						<a class="entry-thumbnail" href="${pageContext.request.contextPath }/">
						    <img src="" alt="">
						</a>
					</td>
					<td class="cart-product-name-info">
						<h4 class='cart-product-description'><a href="detail.html">${item.name_product }</a></h4>
						<div class="row">
							<div class="col-sm-4">
								<div class="rating rateit-small"></div>
							</div>
							<div class="col-sm-8">
								<div class="reviews">
									(${item.id_product } Reviews)
								</div>
							</div>
						</div><!-- /.row -->
						<div class="cart-product-info">
							<span class="product-imel">IMEL:<span>084628312</span></span><br>
							<span class="product-color">COLOR:<span>White</span></span>
						</div>
					</td>
					<td class="cart-product-quantity">
						<div class="cart-quantity">
							<div class="quant-input">
				                <div class="arrows">
				                  <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
				                  <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
				                </div>
				                <input name="quantity" type="text" value="${item.quantity }">
			              </div>
			            </div>
		            </td>
					<td class="cart-product-sub-total"><span class="cart-sub-total-price">${item.price }</span></td>
					<td class="cart-product-grand-total"><span class="cart-grand-total-price">${item.price * item.quantity }</span></td>
				</tr>
				</c:forEach>
			</tbody><!-- /tbody -->
		</table><!-- /table -->
		
	</div>
</div><!-- /.shopping-cart-table --><div class="col-md-4 col-sm-12 estimate-ship-tax">
</div><!-- /.estimate-ship-tax -->

<div class="col-md-4 col-sm-12 estimate-ship-tax">
</div><!-- /.estimate-ship-tax -->

<div class="col-md-4 col-sm-12 cart-shopping-total">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>
					<div class="cart-grand-total">
						Total<span class="inner-left-md">$${s }</span>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>
						<div class="cart-checkout-btn pull-right">
							<a href="${pageContext.request.contextPath }/cart/checkout"  class="btn btn-primary">PROCCED TO CHEKOUT</a>
							<!-- <input type="submit" value="PROCCED TO CHEKOUT"> -->
						</div>
					</td>
				</tr>
		</tbody>
	</table>
</div>		</div>
		</div>
</form>