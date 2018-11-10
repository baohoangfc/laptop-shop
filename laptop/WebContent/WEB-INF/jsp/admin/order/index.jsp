<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>     
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Striped Table with Hover</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
						   <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    	<th>Email Người Đặt Hàng</th>
                                    	<th>Địa Chỉ Người Đặt Hàng</th>
                                    	<th>Sản Phẩm Đặt Hàng</th>
                                    	<th>Hình Thức Thanh Toán</th>
										<th>Tổng Tiền</th>
										<th>Ngày Đặt Hàng</th>
										<th>Trạng Thái</th>
										<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list }" var="obj">
                                        <tr>
                                        	<td>${obj.email }</td>
                                        	<td>${obj.address }</td>
                                        	<td>${obj.phone }</td>
                                        	<td>${obj.name_pay }</td>
                                        	<td>${obj.total }</td>
                                        	<td>${obj.name_pay }</td>
                                        	<td>${obj.date }</td>
                                        	<td>
                                        	   <a href="${pageContext.request.contextPath }/admin/order/view/${obj.id_order}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Xem</a>
		                                       <a href="${pageContext.request.contextPath }/admin/order/del/${obj.id_order}" onclick="return confirm('Bạn có muốn xóa danh mục này không')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Xóa</a>
                                        	</td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
                                
                                <!-- Pagination -->
                            <nav class="text-center" aria-label="...">
                                 <ul class="pagination">
                                 	<c:if test="${page != 1 }">
                                    <li class="disabled"><a href="${pageContext.request.contextPath }/admin/order/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${sumPage }">
                                    	<li <c:if test="${page == i}">class="active"</c:if> ><a href="${pageContext.request.contextPath }/admin/order/${i}">${i } <span class="sr-only">(current)</span></a></li>
                                    </c:forEach>
                                    <c:if test="${page != sumPage }">
                                    <li><a href="${pageContext.request.contextPath }/admin/order/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                	</c:if>
                                </ul> 
                            </nav>
                            <!-- /.pagination -->

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>