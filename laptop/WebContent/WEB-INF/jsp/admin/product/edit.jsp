<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>    
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Edit Profile</h4>
                            </div>
                            <div class="content">
                                <form action="${pageContext.request.contextPath }/admin/product/edit/${objProduct.id_product}" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Mã Sản Phẩm</label>
                                                <input value="${objProduct.production_code }" name="production_code" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên Sản Phẩm</label>
                                                <input value="${objProduct.name_product }" name="name_product" type="text" class="form-control">
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Ảnh Sản Phẩm</label>
                                                <input value="${objProduct.picture }" name="hinhanh" type="file" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Giá Bán</label>
                                                <input value="${objProduct.price }" name="price" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                   <div class="row">
                                   		<div class="col-md-6">
                                            <div class="form-group">
	                                            <label>Danh Mục</label>
	                                            <select name="id_categories" class="form-control">
	                                            	<c:forEach var="objCat" items="${alCat }">
												    	<c:choose>
			                                            	<c:when test="${objProduct.id_categories  eq objCat.cid}">
			                                            		<c:set var="acti" value="selected = 'selected' "></c:set>
			                                            	</c:when>
			                                            	<c:otherwise>
			                                            		<c:set var="acti" value=""></c:set>
			                                            	</c:otherwise>
			                                            </c:choose>
														<option ${acti} value="${objCat.cid}">${objCat.cname }</option>
													</c:forEach>
												</select>
                                        	</div>
                                    	</div>
                                    </div>
                                    
                                    <div class="row">
                                   		<div class="col-md-6">
                                            <div class="form-group">
	                                            <label>Bảo Hành</label>
	                                            <select name="id_guaranree" class="form-control">
	                                            	<c:forEach var="obj" items="${alGua }">
												    	<c:choose>
			                                            	<c:when test="${objProduct.id_guaranree  eq obj.id_guaranree}">
			                                            		<c:set var="acti" value="selected = 'selected' "></c:set>
			                                            	</c:when>
			                                            	<c:otherwise>
			                                            		<c:set var="acti" value=""></c:set>
			                                            	</c:otherwise>
			                                            </c:choose>
														<option ${acti} value="${obj.id_guaranree}">${obj.date }</option>
													</c:forEach>
												</select>
                                        	</div>
                                    	</div>
                                    	<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Giá Bán Sale</label>
                                                <input value="${objProduct.price_sale }" name="price_sale" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                       <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Mô tả</label>
                                                <input value="${objProduct.preview }" name="preview" type="text" class="form-control" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Chi tiết</label>
                                                <textarea name="details" rows="5" class="form-control" >${objProduct.details }</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>