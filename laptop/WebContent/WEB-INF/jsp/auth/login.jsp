<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<div class="sign-in-page inner-bottom-sm">
			<div class="row">
				<!-- Sign-in -->			
<div class="col-md-6 col-sm-6 sign-in">
	<h4 class="">sign in</h4>
	<p class="">Hello, Welcome to your account.</p>
	<!-- <div class="social-sign-in outer-top-xs">
		<a href="#" class="facebook-sign-in"><i class="fa fa-facebook"></i> Sign In with Facebook</a>
		<a href="#" class="twitter-sign-in"><i class="fa fa-twitter"></i> Sign In with Twitter</a>
	</div> -->
	<form action="${pageContext.request.contextPath }/login" method="post" class="register-form outer-top-xs" role="form">
		<div class="form-group">
		    <label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
		    <input name="username" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail1" >
		</div>
	  	<div class="form-group">
		    <label class="info-title" for="exampleInputPassword1">Password <span>*</span></label>
		    <input name="password" type="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1" >
		</div>
		<div class="radio outer-xs">
		  	<label>
		    	<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Remember me!
		  	</label>
		  	<a href="#" class="forgot-password pull-right">Forgot your Password?</a>
		</div>
	  	<button type="submit" class="btn-upper btn btn-primary checkout-page-button">Login</button>
	</form>					
</div>
<!-- Sign-in -->

<!-- create a new account -->
<div class="col-md-6 col-sm-6 create-new-account">
	<h4 class="checkout-subtitle">create a new account</h4>
	<p class="text title-tag-line">Create your own Unicase account.</p>
	<form class="register-form outer-top-xs" role="form" action="${pageContext.request.contextPath }/user/add" method="post">
		<div class="form-group">
	    	<label class="info-title" for="exampleInputEmail2">Email Address <span>*</span></label>
	    	<input name="username" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail2" >
	  	</div>
	  	<div class="form-group">
	    	<label class="info-title" for="exampleInputEmail2">Password <span>*</span></label>
	    	<input name="password" type="password" class="form-control unicase-form-control text-input" id="exampleInputEmail2" >
	  	</div>
	  	<div class="form-group">
	    	<label class="info-title" for="exampleInputEmail2">Full Name <span>*</span></label>
	    	<input name="fullname" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail2" >
	  	</div>
	  	<div class="form-group">
	    	<label class="info-title" for="exampleInputEmail2">Phone <span>*</span></label>
	    	<input name="phone" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail2" >
	  	</div>
	  	<div class="form-group">
	    	<label class="info-title" for="exampleInputEmail2">Address <span>*</span></label>
	    	<input name="address" type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail2" >
	  	</div>
	  	<button type="submit" class="btn-upper btn btn-primary checkout-page-button">Sign Up</button>
	</form>
</div>	
<!-- create a new account -->			</div><!-- /.row -->
		</div>