//FCKConfig.AutoDetectLanguage=true;
//FCKConfig.DefaultLanguage='cn';

//工具条
FCKConfig.ToolbarSets["bbstool"] = [
	['Source','DocProps','-'],
	['Bold','Italic','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],['Image','Flash','Smiley','SpecialChar'],
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],['FitWindow']		
	// No comma for the last row.
] ;

//字体
FCKConfig.FontFormats	= 'p;h1;h2;h3;h4;h5;h6;pre;address;div' ;
FCKConfig.FontNames		= '宋体;黑体;隶书;楷体;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontSizes		= 'smaller;larger;xx-small;x-small;small;medium;large;x-large;xx-large' ;

//回车换行和段落
FCKConfig.EnterMode = 'br' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'p' ;	// p | div | br

//表情图片
FCKConfig.SmileyPath	= FCKConfig.BasePath + 'images/smiley/msn/' ;
FCKConfig.SmileyImages	= ['99.bmp','1.bmp','2.bmp','3.bmp','4.bmp','5.bmp','6.bmp','7.bmp','8.bmp','9.bmp','10.bmp','11.bmp','12.bmp','13.bmp','14.bmp','15.bmp','16.gif','17.gif','18.gif','19.gif','21.gif','22.gif','23.gif','24.gif','25.gif','26.gif','27.gif','28.gif','29.gif','30.gif','31.gif','32.gif','33.gif','34.gif','35.gif','36.gif','37.gif','38.gif'];
FCKConfig.SmileyColumns = 8;
FCKConfig.SmileyWindowWidth		= 350 ;
FCKConfig.SmileyWindowHeight	= 260 ;

FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/office2003/' 

