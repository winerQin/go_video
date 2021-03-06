{{template "concise/Public/Header.tpl"}}

<div id="user">
	<div id="body">
		{{template "concise/User/LeftContent.tpl" .userinfo}}
		<div class="right">
			<div class="box">
				<div class="bd">
					<div class="myin">
						<ul class="nav">
							<li class=dj><a href="/User/ViewComment">我的留言</a></li>
							<li> <a href="/User/ViewMyComment">给我的留言</a> </li>
							<p class="clear"> </p>
						</ul>
					</div>
					<div class="clear"></div>
					
					<ul class="mlist">
						{{with .CommentList}}
						{{range .}}
						<li>
							<div>给<span style="color:#03C;"> {{.Username}} </span>的留言 </div>
							<div class="lynr">
								<p class="nr">{{.Content}}</p>
								<div class="huifu_13 huifu"></div>
								<p style="text-align:right">
									<span>时间：{{.Addtime}}</span>
									<a class="chf" data-id="13" href="javascript:;">查看回复</a>
								</p>
							</div>
						</li>
						{{end}}
						{{end}}
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
{{template "concise/Public/Footer.tpl"}}