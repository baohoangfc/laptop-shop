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
                                        <th>ID</th>
                                    	<th>Username</th>
                                    	<th>Fullname</th>
                                    	<th>Level</th>
										<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${alManager}" var="obj">
                                        <tr>
                                        	<td>${obj.mid }</td>
                                        	<td>${obj.username }</td>
                                        	<td>${obj.fullname }</td>
                                        	<td>${obj.role_name }</td>
                                        	<td>
                                        	   <a href="${pageContext.request.contextPath }/admin/manager/edit/${obj.mid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
		                                       <a href="${pageContext.request.contextPath }/admin/manager/del/${obj.mid}" onclick="return confirm('Bạn có muốn xóa danh mục này không')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Xóa</a>
                                        	</td>
                                        </tr>
                                        </c:forEach>	
                                    </tbody>
                                </table>
                                
                                    <!-- Pagination -->
		                            <nav class="text-center" aria-label="...">
		                                 <ul class="pagination">
		                                 	<c:if test="${sumPage != 1 }">
			                                 	<c:if test="${page != 1 }">
			                                    	<li class="disabled"><a href="${pageContext.request.contextPath }/admin/manager/${page-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
			                                    </c:if>
			                                    <c:forEach var="i" begin="1" end="${sumPage }">
			                                    	<li <c:if test="${page == i}">class="active"</c:if> ><a href="${pageContext.request.contextPath }/admin/manager/${i}">${i } <span class="sr-only">(current)</span></a></li>
			                                    </c:forEach>
			                                    <c:if test="${page != sumPage }">
			                                    	<li><a href="${pageContext.request.contextPath }/admin/manager/${page+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			                                	</c:if>
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