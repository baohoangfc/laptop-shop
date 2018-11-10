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
                                <form action="${pageContext.request.contextPath }/admin/manager/add" method="post">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Tên Tài Khoản</label>
                                                <input name="username" type="text"  class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Mật Khẩu</label>
                                                <input name="password" type="password"  class="form-control" >
                                            </div>
                                        </div>
                                        <!-- <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Xác nhận mật khẩu</label>
                                                <input type="text" class="form-control" >
                                            </div>
                                        </div> -->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên Đầy Đủ</label>
                                                <input name="fullname" type="text" class="form-control"  value="Trần Hoàng Bão">
                                            </div>
                                        </div>
                                       
                                       
                                        <!-- ------------------------------------------------ -->
                                       
                                       
                                        <div class="col-md-5">
                                            <div class="form-group">
	                                            <label>Cấp Bậc</label>
	                                            <select name="role_id" class="form-control">
	                                            	<c:forEach var="obj" items="${alRole }">
												    	<option value="${obj.role_id }">${obj.role_name }</option>
													</c:forEach>
												</select>
                                        	</div>
                                    	</div>
                                    </div>
                                    


                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>