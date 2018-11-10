<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>    
<div class="body-content outer-top-bd">
	<div class="container">
		<div class="checkout-box inner-bottom-sm">
			<div class="row">
				<div class="col-md-8">
					<div class="panel-group checkout-steps" id="accordion">
						<!-- checkout-step-01  -->
<div class="panel panel-default checkout-step-01">

	<!-- panel-heading -->
		<div class="panel-heading">
    	<h4 class="unicase-checkout-title">
	        <a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
	          <span>1</span>Checkout Method
	        </a>
	     </h4>
    </div>
    <!-- panel-heading -->

	<div id="collapseOne" class="panel-collapse collapse in">

		<!-- panel-body  -->
	    <div class="panel-body">
			<div class="row">		

				<!-- guest-login -->			
				<form class="register-form" role="form" action="${pageContext.request.contextPath }/cart/save/account" method="post">
				<div class="col-md-6 col-sm-6 guest-login">
					<h4 class="checkout-subtitle">Checkout as a Guest or Register Login</h4>
					<p class="text title-tag-line">Register with us for future convenience:</p>
					<!-- radio-form  -->

					<h4 class="checkout-subtitle outer-top-vs">Register and save time</h4>
					<div class="form-group">
                        <label>Hình Thức Thanh Toán</label>
                        <select name="id_payment" class="form-control">
                          	<c:forEach var="obj" items="${alPay }">
					    		<option value="${obj.id_payment }">${obj.name_pay }</option>
							</c:forEach>
						</select>
                    </div>
					<button type="submit" class="btn-upper btn btn-primary checkout-page-button checkout-continue ">Submit</button>
				</div>
				</form>
				<!-- guest-login -->

				<!-- already-registered-login -->
				<div class="col-md-6 col-sm-6 already-registered-login">
					<h4 class="checkout-subtitle">Already registered?</h4>
					<p class="text title-tag-line">Please log in below:</p>
					<form class="register-form" role="form" action="${pageContext.request.contextPath }/cart/save" method="post">
						<div class="form-group">
						    <label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
						    <input name="email" type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="admin@gadgets.com">
					 	</div>
						 <div class="form-group">
						    <label class="info-title" for="exampleInputPassword1">Phone<span>*</span></label>
						    <input name="phone" type="text" class="form-control unicase-form-control text-input" id="exampleInputPassword1" placeholder="Password">
						 </div>
						 <div class="form-group">
						    <label class="info-title" for="exampleInputPassword1">Address <span>*</span></label>
						    <input name="address" type="text" class="form-control unicase-form-control text-input" id="exampleInputPassword1" placeholder="Password">
						 </div>
						 <div class="form-group">
	                         <label>Hình Thức Thanh Toán</label>
	                         <select name="id_payment" class="form-control">
	                          	<c:forEach var="obj" items="${alPay }">
						    		<option value="${obj.id_payment }">${obj.name_pay }</option>
								</c:forEach>
							 </select>
                    	 </div>
					  <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Submit</button>
					</form>
				</div>	
				<!-- already-registered-login -->		

			</div>			
		</div>
		<!-- panel-body  -->

	</div><!-- row -->
</div>
<!-- checkout-step-01  -->




					  	
					</div><!-- /.checkout-steps -->
				</div>
				<div class="col-md-4">
					<!-- checkout-progress-sidebar -->
<div class="checkout-progress-sidebar ">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">
		    	<h4 class="unicase-checkout-title">Your Checkout Progress</h4>
		    </div>
		    <div class="panel-body">
				<ul class="nav nav-checkout-progress list-unstyled">
					<li><a href="#">Billing Address</a></li>
					<li><a href="#">Shipping Address</a></li>
					<li><a href="#">Payment Method</a></li>
				</ul>		
			</div>
		</div>
	</div>
</div> 
<!-- checkout-progress-sidebar -->				</div>
			</div><!-- /.row -->
		</div><!-- /.checkout-box -->
		<!-- ============================================== BRANDS CAROUSEL ============================================== -->
<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->