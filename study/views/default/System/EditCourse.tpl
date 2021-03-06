{{template "default/System/Header.tpl" .}}

<div id="user">
	<div id="body"> 
		{{template "default/System/LeftContent.tpl" .userinfo}}
		<div class="right" style="width:760px">
			<div class="box"> 
				<div class="hd"><h3>课程更新</h3>
				<a href="/system/courselist">返回列表</a></div>
				<div class="bd"> 
					<form id="addNewsForm" action="/system/editcourse" enctype="multipart/form-data" method="POST">
						<input type="hidden" name="courseid" value="{{.course.Courseid}}" />
						<table class="tabsList" width="100%" border="0" cellspacing="1" cellpadding="0" style="margin-top:0;">
	            			<tbody><tr>
	            				<td align="right" style="width:80px">课程名称：</td>
	            				<td colspan="5"><input type="text" class="input_middle" name="coursename" value="{{.course.Coursename}}" ></td>
	            			</tr>
	            			<tr>
	            				<td align="right">课程介绍：</td>
	            				<td colspan="5"><textarea class="kindeditor" rows="5" cols="70" style="width:98%" name="intro">{{.course.Intro}}</textarea></td>
	            			</tr>
							<tr>
	            				<td align="right">讲师：</td>
	            				<td><input type="text" name="teacher" class="input_short" value="{{.course.Teacher}}" /></td>
								<td align="right">显示状态：</td>
	            				<td colspan="3">
									<select name="display">
									<option {{if eq .course.Display 1}}selected="selected"{{end}} value="1">显示</option>
									<option {{if eq .course.Display 0}}selected="selected"{{end}} value="0">隐藏</option>
									</select>
								</td>
	            			</tr>
							<tr>
								<td align="right">备注：</td>
								<td colspan="5"><textarea rows="3" cols="70" style="width:98%" name="remark">{{.course.Remark}}</textarea></td>
							</tr>
							<tr>
								<td align="right">课程标签：</td>
								<td colspan="5"><input type="text" name="coursetag" class="input_middle" value="{{.course.Coursetag}}" /></td>
							</tr>
							<tr>
								<td align="right">课程视频：</td>
								<td colspan="5">
								{{with .videolist}}
								{{range .}}
									<div style="margin: 5px 0;">
										<label>名称：<input type="text" name="videonames[]" class="input_short" value="{{.Videoname}}" /></label>
										<label>URL：<input type="text" name="videourls[]" class="input_short" value="{{.Videourl}}" /></label>
										<label>时长：<input type="text" name="durations[]" class="input_small" value="{{.Duration}}" /></label>
										<a href="javascript:void(0);" class="moveUp">上移</a>
		                                <a href="javascript:void(0);" class="moveDown">下移</a>
		                                <a href="javascript:void(0);" class="addOutline">增加</a>
		                                <a href="javascript:void(0);" class="delOutline">删除</a>
									</div>
								{{end}}
								{{end}}
								</td>
							</tr>
							{{if ne .course.Courseimg "" }}
							<tr>
								<td align="right">封面图片：</td>
								<td colspan="5"><img height="100" src="{{.course.Courseimg}}" alt="封面" /></td>
							</tr>
							{{end}}
							<tr>
								<td align="right">上传新封面图片：</td>
								<td colspan="5"><input type="file" name="courseimg" /></td>
							</tr>
							<tr>
	            				<td align="right">价格：</td>
	            				<td><input type="text" name="price" class="input_small" value="{{.course.Price}}" /> (元)</td>
								<td align="right">是否推荐：</td>
	            				<td colspan="3">
									<select name="recommend">
									<option {{if eq .course.Recommend 1}}selected="selected"{{end}} value="1">是</option>
									<option {{if eq .course.Recommend 0}}selected="selected"{{end}} value="0">否</option>
									</select>
								</td>
	            			</tr>
							<tr>
								<td></td>
								<td colspan="5"><button name="submit" class="button" type="submit">保存</button></td>
							</tr>
	            			</tbody>
						</table>
					</form>

				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
<link rel="stylesheet" href="/static/themes/default/js/kindeditor/themes/default/default.css">
<script type="text/javascript">
$(function(){
	$(".tabsList").on('click', '.addOutline', function(){
        $(this).parent().clone().insertAfter($(this).parent()).find('input').val('');
    });
    
    $(".tabsList").on('click', '.delOutline', function(){
        if($(this).parents('td').find(".delOutline").length > 1){
            $(this).parent().remove();
        }else{
            $(this).parent().find('input').val('');
        }
    });
    
    $(".tabsList").on('click', '.moveUp', function(){
        var the = $(this).parent();
        var prev = the.prev();
        if(prev.length > 0){
            the.insertBefore(prev);
        }
    });

    $(".tabsList").on('click', '.moveDown', function(){
        var the = $(this).parent();
        var next = the.next();
        if(next.length > 0){
            the.insertAfter(next);
        }
    });
 });

// KindEditor富文本编辑器
KindEditor.ready(function(K) {
	K.create('.kindeditor', {
		uploadJson : '/system/uploadsystemimage',
		cssPath : ['/static/themes/default/js/kindeditor/plugins/code/prettify.css', 'index.css'],
		items : [
			'source', '|', 'bold','italic','underline','fontname','fontsize','forecolor','hilitecolor','justifyleft','justifycenter','justifyright','justifyfull','insertorderedlist','insertunorderedlist','link','image','code','clearhtml'
		]
	});
});
</script>

{{template "default/System/Footer.tpl"}}