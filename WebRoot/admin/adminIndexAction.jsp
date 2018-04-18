<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>




<%
request.setCharacterEncoding("UTF-8");
String adminUser=request.getParameter("adminUser");    //取得请求中的登录名
String adminPwd=request.getParameter("adminPwd");     //取得请求中的密码

if((adminUser==null||"".equals(adminUser))||(adminPwd==null||"".equals(adminPwd))){
	out.print("输入错误！");
}else{



List list=new ArrayList();

AdminDao adminDao=new AdminDaoImpl();               //得到用户dao的实例
//User user=new User();
//user.setUName(name);
//user.setUPass(password);
list=adminDao.getListByfindAdmin(adminUser);            //根据请求的登录名和密码查找管理人员

//if(list.size()>0){
//response.sendRedirect("index.jsp");
//}else{
//out.print("登入失败！");
//}

//上机7
if(list.size()>0){
	for(int i=0;i<list.size();i++){
  		
		Admin admin=(Admin)list.get(i);
		if(admin!=null&&admin.getAdminPass().equals(adminPwd)){
		     //out.print(user.getUName()+":"+user.getUIdentification());
			session.setAttribute("admin",admin);        //保存用户信息
			
			//把登入用户信息放到map列表中，再把map列表放到appliction全局中,以便知道用户的登入情况
			//Map map=new HashMap();
			//从全局的范围内取出原有访问者列表
		    //if(application.getAttribute("APPADMIN")!=null){
		       // map=(Map)application.getAttribute("APPUSER");
		    //}
			//map.put(admin.getAdminName(),admin);
			//application.setAttribute("APPADMIN",map);
			
			request.setAttribute("msg","管理员 "+adminUser+" 登入成功！");
		    request.getRequestDispatcher("/admin/updateAdmin.jsp").forward(request,response);
			//out.print("登陆成功！");
		}
		else {
			request.setAttribute("msg","请输入用户名和密码！");
		    request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request,response);
		}
	}
}
else{
	        request.setAttribute("msg","请输入用户名和密码！");
		    request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request,response);
}


}
 %>


