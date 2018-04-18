<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@include file="commons/taglibs.jsp" %>

<%
NewsDao newsDao=new NewsDaoImpl();

List newsList=new ArrayList();
List proList=new ArrayList();


newsList=newsDao.findListNews(1);

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>品红人生</title>
   
    <style type="text/css">
    <!--
       body {
	         margin-left: 0px;
	         margin-top: 0px;
	         margin-right: 0px;
	         margin-bottom: 0px;
	         font-size: 12px;
	         color: black;
            }
      td {
      		font-size: 12px;
      		color:#333333;
			font-family:"新宋体";
      	 }
      	 /*超链接无下划线样式*/
	  A
		{
			/*color:#FF9900;*/
			color:#666666;
			text-decoration:none;
			font-size:12px;
		}
	A:hover
		{
			color:#0099FF;
			text-decoration:none;
		}
-->
</style>


<script type="text/javascript">
    function showProInfo(i){
       //下面是废代码，不能这样用
       // var px= window.event.x ;  //x轴鼠标的坐标
       //var py= window.event.y ;  //y轴鼠标的坐标
       //var px=document.getElementById('proImge'+i).style.left;
       //var py=document.getElementById('proImge'+i).style.top;
       
        // alert("x:"+px);
		//alert("y:"+py);
        //document.getElementById('showPro'+i).style.left=px;
		//document.getElementById('showPro'+i).style.top=py+300;
		//
		
		document.getElementById('showPro'+i).style.display='block';
	
		
	}
	
	function hiddeProInfo(i){
		document.getElementById('showPro'+i).style.display='none';
	}
	
	
	
	//当叉了主页（index.jsp）时候该用户从map中删除
	//function closeAddF() 
    //{ 
        //alert("关闭主页！");
       //这里得到用户名，然后把用户名传递到处理页面delApplictionUser.jsp中，在application中删除这个用户 
        //window.open('www.163.com','','width=100,height=10,left=0,top=0'); 
        
       

    //} 
    
   // function window.onunload() 
   // { 
         //if(window.confirm("你要关闭吗？")) 
         //{return 2} 
   // } 
    
	
</script>


  </head>
  
  <body>
  <%@ include file="/commons/top.jsp" %>
<table width="750" height="776" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="258" height="231" valign="top"><table width="256" height="98" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="101" valign="top"><img src="${ctx }/image/d_r7_c1.jpg" width="101" height="35"></td>
        <td width="60" valign="top" background="${ctx }/image/d02.jpg">&nbsp;</td>
        <td width="95" valign="top"><img src="${ctx }/image/d_r7_c14.jpg" width="94" height="35"></td>
      </tr>
      <tr>
        <td colspan="3" valign="top" height="17" style="font-weight:900; color:#FF0000; padding-left:5px; padding-top:5px;">&nbsp;</td>
      </tr>
      <%
      if(newsList.size()<10){
    	  out.print("无新闻！");
      }else{
      for(int i=0;i<10;i++ ){
      	News news=(News)newsList.get(i);
       %>
      <tr>
        <td height="18" colspan="3" valign="top" style="overflow:hidden;background-color: #FFFFFF; font-size: 12px; font-family: '新宋体'; color: #666666; border-bottom: 1px #9BB4FB dashed; padding-left: 10px; letter-spacing: 0.1em; line-height: 110%; word-wrap: break-word; word-break: break-all; width: 256px; padding-top:5px;"><a href="${ctx}/newsDetail/doNews.jsp?newsId=<%=news.getNewsId()%>"><%=news.getTitle() %></a>【<%=news.getPublishTime().toString().substring(0, 11) %>】</td>
      </tr>
      <%
      }
      }
       %>
      <tr>
        <td colspan="3" align="right" valign="top"><img src="image/d_r11_c15.jpg" width="51" height="33"></td>
      </tr>
    </table></td>
    <td width="19">&nbsp;</td>
    <td width="295" valign="top"><table width="268" height="56" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="268" height="56"><img src="${ctx }/image/d_r11_5_r1_c1.jpg"></td>
        </tr>
	  
	  <tr>
        <td height="56"><img src="${ctx }/image/d_r11_5_r3_c1.jpg"></td>
        </tr>
	  
	  <tr>
        <td height="56"><img src="${ctx }/image/d_r11_5_r4_c1.jpg"></td>
        </tr>
	  
	  <tr>
        <td height="56"><img src="${ctx }/image/d_r11_5_r5_c1.jpg"></td>
        </tr>
      
    </table></td>
    <td width="178" rowspan="3" valign="top"><table width="175" height="765" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="170" height="54" align="left" valign="top"><img src="${ctx }/image/d_r11_6.jpg" width="175" height="42"></td>
      </tr>
      <tr>
        <td height="554" align="center" valign="middle">
        <!-- 指向链接图片url -->
        <div id=demo style=overflow:hidden;height:600;width:170;background:#214984;color:#ffffff>
         <div id=demo1>
         <!-- 定义图片 -->

             <%
             	ProuctDao productDao = new ProductDaoImpl();
             	List productList = productDao.findListProduct(1);
             	
             	int proCount=productList.size();
             	
             		
             	session.setAttribute("productList",productList);
             	for (int i = 0; i < productList.size(); i++) {
             		Product productDes = (Product) productList.get(i);
             %>
             <img src="${ctx }<%=productDes.getPicture()%>" width="100%" height="107" border="0" align="middle" />
             
             <%
             }
             %>
</div>
<div id=demo2></div>   
        </DIV>
    
         <p>
           <script>
			var speed=30;
			demo2.innerHTML=demo1.innerHTML;
			demo.scrollTop=demo.scrollHeight;
			function Marquee(){
			if(demo1.offsetTop-demo.scrollTop>=0)
				demo.scrollTop+=demo2.offsetHeight;
			else{
				demo.scrollTop--;    //向下移动
				}
			}
			var MyMar=setInterval(Marquee,speed);
			demo.onmouseover=function() {clearInterval(MyMar)}
			demo.onmouseout=function() {MyMar=setInterval(Marquee,speed);}
         </script>
          </p>
         <p>&nbsp;</p>
         <p><img src="image/tpinghong.gif" width="124" height="46">        </p></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td height="27" colspan="3" valign="top"><table width="570" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="236" height="27" valign="top" background="${ctx }/image/d_r11_8.jpg"><img src="${ctx }/image/d_r13_c1.jpg" width="160" height="27"></td>
        <td width="334" align="right" valign="top" background="${ctx }/image/d_r11_8.jpg"><img src="${ctx }/image/d_r11_11_r1_c30.jpg" width="63" height="27"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="280" colspan="3" valign="top"><table width="570" height="516" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="365" colspan="3" valign="top">
        <table width="569" height="153" border="0" cellpadding="0" cellspacing="0">
        <c:forEach items="${productList }" var="item" varStatus="i">
          <c:if test="${i.index%3==0}"><tr></c:if>
            <td width="143" ><a href="${ctx }/proDetail/doProduct.jsp?productId=${item.productId }"><img src="${ctx }${item.picture }" onMouseOver="showProInfo(${i.index })" onMouseOut="hiddeProInfo(${i.index })" id="proImge${i.index }" style="border: none;" width="143" height="112"></a>
                 
                   <DIV  id="showPro${i.index }" style="display:none; width:228px; height:175px; position:absolute; background-image:url(image/proInfo.gif); background-repeat:no-repeat;  padding-left:40px;padding-top:20px;">
        				
        				<table width="174" height="133" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="2" align="center" style="color:#FF0000">最新商品信息</td>
  </tr>
   <tr>
    <td width="34" style="border-bottom:1px #66CCFF dotted;">编号</td>
    <td width="159" style="border-bottom:1px #66CCFF dotted; border-left:1px #66CCFF  dotted;">${item.serialNumber}</td>
  </tr>
  <tr>
  <tr>
    <td width="34" style="border-bottom:1px #66CCFF dotted; ">名称</td>
    <td width="159" style="border-bottom:1px #66CCFF dotted; border-left:1px #66CCFF  dotted;color:#FF0000">${item.names}</td>
  </tr>
  <tr>
    <td style="border-bottom:1px #66CCFF dotted;">品&nbsp;牌</td>
    <td style="border-bottom:1px #66CCFF dotted; border-left:1px #66CCFF  dotted;">${item.brand}</td>
  </tr>
   <tr>
    <td height="20" style="border-right:1px #66CCFF dotted;">提&nbsp;示</td>
    <td style=" border-left:1px #66CCFF  dotted; color:#FF0000">如果喜欢，请点击查看详细产品信息！</td>
  </tr>
</table>
</DIV>
                  
            </td>
          <c:if test="${i.index%3==2}"><tr></tr></c:if>
          </c:forEach>
        </table>
              
        </td>
      </tr>
      <tr>
        <td width="189" height="29" valign="top" background="${ctx }/image/d_r11_8.jpg"><img src="${ctx }/image/cg1_r10_c1.jpg" width="188" height="28"></td>
        <td width="271" align="right" valign="top" background="${ctx }/image/d_r11_8.jpg"><img src="${ctx }/image/d_r11_11_r1_c21.jpg" width="160" height="27"></td>
        <td width="110" align="right" valign="top" background="${ctx }/image/d_r11_8.jpg"><img src="${ctx }/image/d_r11_11_r1_c30.jpg" width="63" height="27"></td>
      </tr>
      <tr>
        <td valign="top"><table width="189" height="110" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="28" height="38"><img src="${ctx }/image/d_r11_12_r1_c1.jpg" width="28" height="32"></td>
            <td width="62">业务专线：</td>
            <td width="99">010-888888888</td>
          </tr>
          <tr>
            <td><img src="${ctx }/image/d_r11_12_r1_c1.jpg" width="28" height="32"></td>
            <td>售后服务：</td>
            <td>010-999999999</td>
          </tr>
          <tr>
            <td><img src="${ctx }/image/d_r11_12_r1_c1.jpg" width="28" height="32"></td>
            <td>传&nbsp;&nbsp;&nbsp;&nbsp;真：</td>
            <td>010-666666666</td>
          </tr>
        </table></td>
        <td colspan="2" valign="top"><table width="379" height="120" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="${ctx }/image/f1.gif"></td>
            <td><img src="${ctx }/image/f2.gif"></td>
            <td><img src="${ctx }/image/f3.gif"></td>
          </tr>
          <tr>
            <td><img src="${ctx }/image/d_r11_13_r1_c1.jpg"></td>
            <td><img src="${ctx }/image/d_r11_13_r1_c7.jpg"></td>
            <td><img src="${ctx }/image/f3.gif"></td>
          </tr>
        </table></td>
        </tr>
    </table></td>
  </tr>
</table>


 <%@ include file="/commons/bottom.jsp" %>
  </body>
</html>


  
