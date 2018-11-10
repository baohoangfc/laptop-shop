<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>     
		<div class="col-xs-12 col-sm-12 col-md-3 sidebar">
			
			<!-- ================================== TOP NAVIGATION ================================== -->
<div class="side-menu animate-dropdown outer-bottom-xs">
    <div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Categories</div>        
    <nav class="yamm megamenu-horizontal" role="navigation">
        <ul class="nav">
           <!-- /.menu-item -->
			<c:forEach items="${alCat }" var="obj">
			<c:if test="${obj.cid != 0 && obj.id_parent == 0}">
	            <li class="dropdown menu-item">
	                 <a href="${pageContext.request.contextPath }/${obj.cname}/${obj.cid}" class="dropdown-toggle" data-toggle="dropdown"><i class="icon fa fa-mobile fa-fw"></i>${obj.cname }</a>
				<ul class="dropdown-menu mega-menu">
				    <li class="yamm-content">
				        <div class="row">
				            <div class="col-xs-12 col-sm-12 col-lg-4">
				                <ul>
				                <c:forEach items="${alCat }" var="objCat">
				                <c:if test="${objCat.id_parent != 0 && objCat.id_parent == obj.cid }">
				                    <li><a href="${pageContext.request.contextPath }/${objCat.cname}/${objCat.cid}">${objCat.cname }</a></li>
				                </c:if>
				                </c:forEach>
				                </ul>
				            </div>
				
				            <div class="dropdown-banner-holder">
				                <a href="#"><img alt="" src="${pageContext.request.contextPath }/templates/public/assets/images/banners/banner-side.png" /></a>
				            </div>
				        </div>
				    </li>       
				</ul>
			</li>
			</c:if>
			</c:forEach>	
<!-- /.menu-item -->
          
        </ul><!-- /.nav -->
    </nav><!-- /.megamenu-horizontal -->
</div><!-- /.side-menu -->
<!-- ================================== TOP NAVIGATION : END ================================== -->

<div class="sidebar-widget outer-bottom-small wow fadeInUp">
	<h3 class="section-title">Special Deals</h3>
	<div class="sidebar-widget-body outer-top-xs">
		<div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">
	    		        <div class="item">
	        	<div class="products special-product">
		        							<div class="product">
							<div class="product-micro">
	<div class="row product-micro-row">
		<div class="col col-xs-5">
			<div class="product-image">
				<div class="image">
					<a href="${pageContext.request.contextPath }/templates/public/assets/images/products/sm1.jpg" data-lightbox="image-1" data-title="Nunc ullamcors">
						<img data-echo="${pageContext.request.contextPath }/templates/public/assets/images/products/sm1.jpg" src="${pageContext.request.contextPath }/templates/public/assets/images/blank.gif" alt="">
						<div class="zoom-overlay"></div>
					</a>					
				</div><!-- /.image -->
					
					
								</div><!-- /.product-image -->
		</div><!-- /.col -->
		<div class="col col-xs-7">
			<div class="product-info">
				<h3 class="name"><a href="#">Sony Ericson Vaga</a></h3>
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
<!-- ============================================== SPECIAL DEALS : END ============================================== -->
			<!-- ============================================== NEWSLETTER ============================================== -->
<div class="sidebar-widget newsletter wow fadeInUp outer-bottom-small">
	<h3 class="section-title">Newsletters</h3>
	<div class="sidebar-widget-body outer-top-xs">
		<p>Sign Up for Our Newsletter!</p>
        <form role="form">
        	 <div class="form-group">
			    <label class="sr-only" for="exampleInputEmail1">Email address</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Subscribe to our newsletter">
			  </div>
			<button class="btn btn-primary">Subscribe</button>
		</form>
	</div><!-- /.sidebar-widget-body -->
</div><!-- /.sidebar-widget -->
<!-- ============================================== NEWSLETTER: END ============================================== -->

<div class="sidebar-widget  wow fadeInUp outer-top-vs ">
	<div id="advertisement" class="advertisement">
        <div class="item bg-color">
            <div class="container-fluid">
                <div class="caption vertical-top text-left">
                    <div class="big-text">
                        Save<span class="big">50%</span>
                    </div>
                        

                    <div class="excerpt">
                        on selected items
                    </div>
                </div><!-- /.caption -->
            </div><!-- /.container-fluid -->
        </div><!-- /.item -->

        <div class="item" style="background-image: url('${pageContext.request.contextPath }/templates/public/assets/images/advertisement/1.jpg');">
            
        </div><!-- /.item -->

        <div class="item bg-color">
            <div class="container-fluid">
                <div class="caption vertical-top text-left">
                    <div class="big-text">
                        Save<span class="big">50%</span>
                    </div>
                        

                    <div class="excerpt fadeInDown-2">
                        on selected items
                    </div>
                </div><!-- /.caption -->
            </div><!-- /.container-fluid -->
        </div><!-- /.item -->

    </div><!-- /.owl-carousel -->
</div>
    
<!-- ============================================== COLOR: END ============================================== -->


		</div><!-- /.sidemenu-holder -->