<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action=AddPhotos method="post">
		<table cellspacing=10 border=0>

			<tr>
				<td align=right width=250>I სურათი :</td>
				<td align=left><input type="FILE" name="photo1" size=80>
				</td>
			</tr>
			<tr>
				<td align=right width=250>II სურათი :</td>
				<td align=left><input type="FILE" name="photo2" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>III სურათი :</td>
				<td align=left><input type="FILE" name="photo3" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>IV სურათი :</td>
				<td align=left><input type="FILE" name="photo4" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>V სურათი :</td>
				<td align=left><input type="FILE" name="photo5" size=80>
				</td>
			</tr>

			<tr>
				<td align=right width=250>VI სურათი :</td>
				<td align=left><input type="FILE" name="photo6" size=80>
				</td>
			</tr>

			<tr>
				<td align="center" id="addingParent"><br> <input
					id="adding" type="submit" name="add" value="დამატება" /></td>
			</tr>
		</table>
	</form>
</body>
</html>