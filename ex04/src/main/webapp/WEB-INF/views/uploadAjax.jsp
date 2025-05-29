<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.uploadResult { width: 100%; background-color: gray; }
	.uploadResult ul { display: flex; flex-flow: row; justify-content: center; align-items: center; }
	.uploadResult ul li { list-style: none; padding: 10px; }
	.uploadResult ul li img { width: 100px; }
	.uploadResult ul li span { color: white; }
	.bigPictureWrapper { position: absolute; display: none; justify-content: center; align-items: center; top: 0%;
							width: 100%; height: 100%; background-color: gray; z-index: 100; background: rgba(255, 255, 255, 0.5); }
	.bigPicture { position: relative; display: flex; justify-content: center; align-items: center; }
	.bigPicture img { width: 600px; }
</style>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<div class="uploadResult">
	<ul>

	</ul>
</div>
<div class="bigPictureWrapper">
	<div class="bigPicture">
	
	</div>
</div>
<button id="uploadBtn">Upload</button>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function showImage(fileCallPath) {
		alert(fileCallPath);
	}

	$(document).ready(function() {
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			for (var i = 0; i < files.length; i++)
			{
				if(!checkExtension(files[i].name, files[i].size))
				{
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
		$.ajax({
			url: "/uploadAjaxAction",
			processData: false,
			contentType: false,
			data: formData,
			type: "post",
			dataType: "json",
			success: function(result) {
				console.log(result);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		})
		})
	})
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize)
	{
		if (fileSize >= maxSize)
		{
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName))
		{
			alert("해당 확장자는 업로드 할 수 없습니다");
			return false;
		}
		return true;
	}
	
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr) {
		var str = "";
		$(uploadResultArr).each(function(i, obj) {
			if (!obj.image)
			{
				var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				str += "<li><a href='/download?fileName=" + fileCallPath + "'>" + obj.fileName + "</a></li>";
			}
			else {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\")<img src='/display?fileName=" + fileCallPath + "'></a></li>";
				console.log(fileCallPath);
			}
		});
		uploadResult.append(str);
	}
</script>
</body>
</html>