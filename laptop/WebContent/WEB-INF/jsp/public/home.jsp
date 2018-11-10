<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>    
		<div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder">
			<!-- ========================================== SECTION – HERO ========================================= -->
			
<div id="hero">
	<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
		<c:forEach items="${alSlide }" var="objS">
		<div class="item" style="background-image: url(${pageContext.request.contextPath }/files/${objS.image });">
			<div class="container-fluid">
				<div class="caption bg-color vertical-center text-left">
					<div class="big-text fadeInDown-1">
						The new <span class="highlight">imac</span> for you
					</div>

					<div class="excerpt fadeInDown-2 hidden-xs">
						 
					<span>21.5-Inch Now Starting At $1099 </span>
					<span>27-Inch Starting At $1799</span>
					</div>
					<!-- <div class="button-holder fadeInDown-3">
						<a href="index.php?page=single-product" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a>
					</div> -->
				</div><!-- /.caption -->
			</div><!-- /.container-fluid -->
		</div><!-- /.item -->
		</c:forEach>
		

	</div><!-- /.owl-carousel -->
</div>
			
<!-- ========================================= SECTION – HERO : END ========================================= -->	

			<!-- ============================================== INFO BOXES ============================================== -->
<div class="info-boxes wow fadeInUp">
	<div class="info-boxes-inner">
		<div class="row">
			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
						     <i class="icon fa fa-dollar"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading green">money back</h4>
						</div>
					</div>	
					<h6 class="text">30 Day Money Back Guarantee.</h6>
				</div>
			</div><!-- .col -->

			<div class="hidden-md col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-truck"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading orange">free shipping</h4>
						</div>
					</div>
					<h6 class="text">free ship-on oder over $600.00</h6>	
				</div>
			</div><!-- .col -->

			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-gift"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading red">Special Sale</h4>
						</div>
					</div>
					<h6 class="text">All items-sale up to 20% off </h6>	
				</div>
			</div><!-- .col -->
		</div><!-- /.row -->
	</div><!-- /.info-boxes-inner -->
	
</div><!-- /.info-boxes -->
<!-- ============================================== INFO BOXES : END ============================================== -->
			<!-- ============================================== SCROLL TABS ============================================== -->
<div id="product-tabs-slider" class="scroll-tabs outer-top-vs wow fadeInUp">
	<div class="more-info-tab clearfix ">
	   <h3 class="new-product-title pull-left">New Products</h3>
		<ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
			<li class="active"><a data-transition-type="backSlide" href="#all" data-toggle="tab">All</a></li>
			<li><a data-transition-type="backSlide" href="#smartphone" data-toggle="tab">laptop</a></li>
			<li><a data-transition-type="backSlide" href="#apple" data-toggle="tab">apple</a></li>
		</ul><!-- /.nav-tabs -->
	</div>

	<div class="tab-content outer-top-xs">
		<div class="tab-pane in active" id="all">			
			<div class="product-slider">
				<div class="owl-carousel home-owl-carousel custom-carousel owl-theme" data-item="4">
	<c:forEach items="${alProduct }" var="obj">			    	
		<div class="item item-carousel">
			<div class="products">
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img  src="https://fptshop.com.vn/Uploads/images/iphone%20-6-plus.jpg" data-echo="https://fptshop.com.vn/Uploads/images/iphone%20-6-plus.jpg" alt=""></a>
			</div><!-- /.image -->			

			<div class="tag new"><span>new</span></div>                        		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="${pageContext.request.contextPath }/${slugUtil.createSlug(obj.name_product)}/${obj.id_product}.html">${obj.name_product }</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price" >${obj.price_sale }</span>
				<span id="price" data-value="${obj.price_sale }" class="price-before-discount">${obj.price }</span>
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<a class="btn btn-primary icon" href="${pageContext.request.contextPath }/cart/buy/${obj.id_product}" title="Wishlist">
								 <i  class="fa fa-shopping-cart"></i>
							</a>
							
							<a class="btn btn-primary" href="${pageContext.request.contextPath }/cart/buy/${obj.id_product}" title="Wishlist">
								 Add to cart
							</a>						
						</li>
	                   
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
		</c:forEach>		
						</div><!-- /.home-owl-carousel -->
			</div><!-- /.product-slider -->
		</div><!-- /.tab-pane -->

		<div class="tab-pane" id="smartphone">
			<div class="product-slider">
				<div class="owl-carousel home-owl-carousel custom-carousel owl-theme">
				    	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img  src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" data-echo="${pageContext.request.contextPath }/templates/public/assets/images/products/3.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Apple Iphone 5s 32GB</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-retweet"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
						</div><!-- /.home-owl-carousel -->
			</div><!-- /.product-slider -->
		</div><!-- /.tab-pane -->


		<div class="tab-pane" id="apple">
			<div class="product-slider">
				<div class="owl-carousel home-owl-carousel custom-carousel owl-theme">
				    	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img  src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" data-echo="${pageContext.request.contextPath }/templates/public/assets/images/products/3.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Apple Iphone 5s 32GB</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-retweet"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
						</div><!-- /.home-owl-carousel -->
			</div><!-- /.product-slider -->
		</div><!-- /.tab-pane -->

	</div><!-- /.tab-content -->
</div><!-- /.scroll-tabs -->
<!-- ============================================== SCROLL TABS : END ============================================== -->
			<!-- ============================================== WIDE PRODUCTS ============================================== -->
<div class="wide-banners wow fadeInUp outer-bottom-vs">
	<div class="row">

		<div class="col-md-7">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="${pageContext.request.contextPath }/templates/public/assets/images/banners/1.jpg" src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" alt="">
				</div>	
				<div class="strip">
					<div class="strip-inner">
						<h3 class="hidden-xs">samsung</h3>
						<h2>galaxy</h2>
					</div>	
				</div>
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

		<div class="col-md-5">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="${pageContext.request.contextPath }/templates/public/assets/images/banners/2.jpg" src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" alt="">
				</div>	
				<div class="strip">
					<div class="strip-inner">
						<h3 class="hidden-xs">new trend</h3>
						<h2>watch phone</h2>
					</div>	
				</div>
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

	</div><!-- /.row -->
</div><!-- /.wide-banners -->

<!-- ============================================== WIDE PRODUCTS : END ============================================== -->
			<!-- ============================================== FEATURED PRODUCTS ============================================== -->
<!-- /.section -->
<!-- ============================================== FEATURED PRODUCTS : END ============================================== -->
			<!-- ============================================== WIDE PRODUCTS ============================================== -->
<div class="wide-banners wow fadeInUp outer-bottom-vs">
	<div class="row">

		<div class="col-md-12">
			<div class="wide-banner cnt-strip">
				<div class="image">
					<img class="img-responsive" data-echo="${pageContext.request.contextPath }/templates/public/assets/images/banners/3.jpg" src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" alt="">
				</div>	
				<div class="strip strip-text">
					<div class="strip-inner">
						<h2 class="text-right">one stop place for<br>
						<span class="shopping-needs">all your shopping needs</span></h2>
					</div>	
				</div>
				<div class="new-label">
				    <div class="text">NEW</div>
				</div><!-- /.new-label -->
			</div><!-- /.wide-banner -->
		</div><!-- /.col -->

	</div><!-- /.row -->
</div><!-- /.wide-banners -->
<!-- ============================================== WIDE PRODUCTS : END ============================================== -->
			<!-- ============================================== BEST SELLER ============================================== -->

<div class="sidebar-widget wow fadeInUp outer-bottom-vs">
	<h3 class="section-title">Best seller</h3>
	<div class="sidebar-widget-body outer-top-xs">
		<div class="owl-carousel best-seller custom-carousel owl-theme outer-top-xs">
	        	        <div class="item">
	        	<div class="products best-product">
		        							<div class="product">
							<div class="product-micro">
	<div class="row product-micro-row">
		<div class="col col-xs-5">
			<div class="product-image">
				<div class="image">
					<a href="${pageContext.request.contextPath }/templates/public/assets/images/products/s1.jpg" data-lightbox="image-1" data-title="Nunc ullamcors">
						<img data-echo="${pageContext.request.contextPath }/templates/public/assets/images/products/s1.jpg" src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" alt="">
						<div class="zoom-overlay"></div>
					</a>					
				</div><!-- /.image -->
					
											<div class="tag tag-micro new">
							<span>new</span>
						</div>
					
								</div><!-- /.product-image -->
		</div><!-- /.col -->
		<div class="col col-xs-7">
			<div class="product-info">
				<h3 class="name"><a href="#">Asus Zenphone 6</a></h3>
				<div class="rating rateit-small"></div>
				<div class="product-price">	
				<span class="price">
					$650.99				</span>
				
			</div><!-- /.product-price -->
				<div class="action"><a href="#" class="lnk btn btn-primary">Add To Cart</a></div>
			</div>
		</div><!-- /.col -->
	</div><!-- /.product-micro-row -->
</div><!-- /.product-micro -->
      
						</div>
		        		        	</div>
	        </div>
	    		    </div>
	</div><!-- /.sidebar-widget-body -->
</div><!-- /.sidebar-widget -->

		</div><!-- /.homebanner-holder -->
	