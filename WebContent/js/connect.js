
function flooda(obj){
	var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
		+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛仓库</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
		+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
		+ "<td>避雷器(组):</td><td>"
		+ obj.blq
		+ "</td><td>彩布条(条):</td><td>"
		+ obj.cbt
		+ "</td></tr><tr><td>草包(件):</td><td>"
		+ obj.cb
		+ "</td><td>发电机(台):</td><td>"
		+ obj.fdj
		+ "</td></tr>" 
		+"<tr><td>电缆(米):</td><td>"
		+ obj.dl
		+ "</td><td>电缆保护管(米):</td><td>"
		+ obj.bhg
		+ "</td></tr>"
		+"<tr><td>斧子(把):</td><td>"
		+ obj.fz
		+ "</td><td>钢桩基及附件(根):</td><td>"
		+ obj.gz
		+ "</td></tr>"
		+"<tr><td>所属乡镇:</td><td>"
		+ obj.qy
		+ "</td></tr></tbody></table></div></div></div>"
		return con;
}

function organizea(obj){
	var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
		+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛队伍</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
		+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
		+ "<td>负责人:</td><td>"
		+ obj.fzr
		+ "</td><td>联系方式:</td><td>"
		+ obj.phone
		+ "</td></tr><tr><td>人员数(名):</td><td>"
		+ obj.ry
		+ "</td><td>所属乡镇:</td><td>"
		+ obj.qy
		+ "</td></tr>" 
		+"<tr><td>组织描述:</td><td colspan='3'>"
		+ obj.zzms
		+ "</td></tr></tbody></table></div></div></div>"
		return con;
}

function yuana(obj){
	var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
		+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛预案</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
		+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
		+ "<td>文件类型:</td><td>"
		+ obj.wjlx
		+ "</td><td>文件类别:</td><td>"
		+ obj.wjlb
		+ "</td></tr><tr><td>创建人:</td><td>"
		+ obj.cjr
		+ "</td><td>上传时间:</td><td>"
		+ obj.time
		+ "</td></tr>"
		+"<tr><td>实施时间:</td><td>"
		+ obj.sstime
		+ "</td><td>所属乡镇:</td><td>"
		+ obj.qy
		+ "</td></tr>" 
		+"<tr><td>文件描述:</td><td colspan='3'>"
		+ obj.wjms
		+ "</td></tr>" 
		+"<tr><td><a href='../../upload/高淳预案.doc'>文件下载</a></td></tr></tbody></table></div></div></div>"
		return con;
}
function bengza(obj){
	var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
		+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>泵站信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
		+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
		+ "<td>时刻:</td><td>"
		+ obj.time
		+ "</td><td>流量:</td><td>"
		+ obj.zll
		+ "</td></tr><tr><td>上游水位:</td><td>"
		+ obj.sysw
		+ "</td><td>下游水位:</td><td>"
		+ obj.xysw
		+ "</td></tr>"
		+"<tr><td><a href='#'>详细信息</a></td>" 
		+"<td><a href='#'>实时监控</a></td>"
		+ "<td><a href='#'>视频监控</a></td>"
		+ "</tr></tbody></table></div></div></div>"
		return con;
}
function shuiza(obj){
	var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
		+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>水闸信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
		+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
		+ "<td>时刻:</td><td>"
		+ obj.time
		+ "</td><td>流量:</td><td>"
		+ obj.zll
		+ "</td></tr><tr><td>闸上水位:</td><td>"
		+ obj.sysw
		+ "</td><td>闸下水位:</td><td>"
		+ obj.xysw
		+ "</td></tr>"
		+"<tr><td><a href='#'>详细信息</a></td>" 
		+"<td><a href='#'>实时监控</a></td>"
		+ "<td><a href='#'>视频监控</a></td>"
		+ "</tr></tbody></table></div></div></div>"
		return con;
}