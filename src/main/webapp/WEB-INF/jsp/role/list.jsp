<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../../jsp/common/resource.jsp"%>
<%@ include file="../../jsp/common/tags.jsp"%>
<jsp:include page="../../jsp/common/autoHeight.jsp" />
<title>角色管理</title>
	<shiro:hasPermission name="role:update">
	 <c:set value="1" var="allow_update" />
	 </shiro:hasPermission>	
	 <shiro:hasPermission name="role:delete">
	 <c:set value="1" var="allow_delete" />
	</shiro:hasPermission>
</head>
<body>   
	<div class="col_main lightshadow" id="forAutoHeight">
        <h2 class="page_headline"><span class="c_blue store_title">角色列表</span></h2>
        <div class="pb50">
          <!-- 表格开始 -->
			    <div class="table_grid">
			        <ul class="table_title">
			            <li class="w120">角色名称</li>
			            <li class="w200">角色描述</li>
			            <li class="w200">拥有的资源</li>
			            <li class="w100">操作</li>					           
			        </ul>
			         <c:forEach items="${roleList}" var="role">
				        <ul class="table_content">
				            <li class="w120">${role.role}</li>
				            <li class="w200">${role.description}</li>
				            <li class="w200">${shbfn:resourceNames(role.resourceIdsList)}</li>			          
				            <li class="w100">
				            	<c:if test="${allow_update==1}">
			                        <a href="${ctx}/role/${role.id}/update">修改</a>
			                    </c:if>
			                    <c:if test="${allow_delete==1}">
			                        <a href="${ctx}/role/${role.id}/delete">删除</a>
			                     </c:if>
				            </li>
				        </ul>
			        </c:forEach>
			    </div>
			    <br/><br/>
           	<span class="page_center">
            	${pagetag}
            </span>
             <!-- 表格结束-->
        </div>  
	        <c:if test="${not empty msg}">
			    <div class="message">${msg}</div>
			</c:if>
			
			<shiro:hasPermission name="role:create">
			    <a href="${ctx}/role/create"  class="btn btn_primary" style="float: right;">角色新增</a><br/>
			</shiro:hasPermission>
      </div>
</body>
</html>