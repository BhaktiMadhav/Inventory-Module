<html>
<head>
	<title>BRAND</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	<script language="javascript">
	function validate( )
	{	
		var brand=document.brandform.brand.value;
		
		if(brand=="")
		{
			alert("Please type Brand Name");
			return false;
		}
		else 
		{
			return true;
		}
	}
	</script>
</head>

<body>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">Simple <span>World</span></a></h1>
			</div>
			<div id="menu">
				<ul>
					<li class="current_page_item"><a href="home1.jsp">Homepage</a></li>
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="brand.jsp">BRAND</a></h2>
					New Brand
					<br><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
				</div>	

				<div class="post">
					<div class="entry">
						<a href="#"><font size="4">Brand Details</font></a><br><br><br>
						
						<form method="post" action="brand_action.jsp" name="brandform">
						Brand Name<br><br>
						<input type="text" name="brand" style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" ><br><br><br>
						Description<br><br>
						<textarea rows="5" cols="15" name="description" style="width: 500px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" ></textarea>
						<br><br>
						<input type="submit" value="Save" style="padding: 3px;" onclick="return validate();">
						</form>
						
					</div>
				</div>
				
			</div>
			<!-- end #content -->
			
			<div id="sidebar">
				<ul>
					<li>
						<h2>Categories</h2>
						<ul>
							<li><a href="home1.jsp">Homepage</a></li>
							<li><a href="purchasereceipt.jsp">Purchase Receipt</a></li>
							<li><a href="deliverynote.jsp">Delivery Note</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- end #page -->
		<div id="footer">
			
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>

