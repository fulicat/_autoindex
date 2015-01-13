<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<meta name="description" content="autoindex for nginx">
<meta name="keywords" content="autoindex">
<meta name="author" content="Jack.Chan">
<style>
html{background-color:#fff;}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, hr, pre, code, form, input, button, fieldset, textarea, p, blockquote, th, td {margin:0;padding:0;}
body,button,input,select,textarea{
	font:14px/1.5 Helvetica, "STHeitiSC-Medium", "Microsoft Yahei", "Sans-Serif", Tahoma, Arial, \5b8b\4f53;
}
table{border-collapse:collapse;border-spacing:0;table-layout:fixed;}
fieldset, img{border:0;}
address, caption, cite, code, dfn, em, strong, th, var{font-style:normal;font-weight:normal;}
ol, ul{list-style:none;}
del, ins{text-decoration:none;}
caption, th{text-align:left;}
h1, h2, h3, h4, h5, h6{font-size:100%;font-weight:normal;}
input, button, textarea, select{font-size:100%;}
q:before, q:after{content:'';}
addr, acronym{border:0;font-variant:normal;}
sup, sub{vertical-align:baseline:}
button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0;}

.wrapfix{*zoom:1;}
.wrapfix:after{content:'\20';display:block;height:0;clear:both;}


a{color:#0078b6;text-decoration:none;}
a:hover{color:#f60;text-decoration:underline;}
<?if($file){?>
html{
	background-color:#f9f9f9;
	
}
html,body{
	overflow:hidden;
}
<?}?>

body{
	color:#333;
}
body *{
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}


.unselect,
.assistive-touch{
	-webkit-touch-callout:none;
	-webkit-user-select:none;
	-khtml-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	touch-callout:none;
	user-select:none;
	-webkit-tap-highlight-color:rgba(201, 224, 253, 0);
}


.list,
.list>dt,
.list>dd{
	padding:0;
	margin:0;
}
.list{
	list-style:none;
	margin:5px;
}
.list>dt{
	font-size:16px;
	font-weight:bold;
	padding:10px 5px;
}
.list>dd,
.list>li{
	display:block;
	padding:6px;
	margin:0;
	border-bottom:1px #ccc solid;
}
.list>dd+dd,
.list>li+li{
	
}
.list>dd:after,
.list>li:after{
	content:"\20";
	clear:both;
	display:block;
	width:0;
	height:0;
}
.list>dd:hover{
	border-bottom-color:#2CC38E;
	background-color:#FAFFFB;
}
.list>dd.root{
	border-left:1px red solid;
}
.list>dd>a{
	padding:3px 6px;
	display:inline-block;
	color:#00A4E9;
	text-decoration:none;
}

.list>dd .mtime{
	color:#ccc;
	font-size:10px;
	float:right;
	padding:4px 6px;
}

.list-file a.external{
	content:"\20";
	display:inline-block;
	vertical-align:middle;
	margin-left:5px;
	width:16px;
	height:16px;
	background:url(data:image/gif;base64,R0lGODlhDgAQAKIGAHeDoilBfc/V5NTU1B03ev///////wAAACH5BAEAAAYALAAAAAAOABAAAAM5aLrc/pBIqaYsGARqCP6YQGxVMZynKABEiQ7i13Zm6hWNZw9YboqnwmzhAQaHJRAG2bFYINCoFJIAADs=) no-repeat;
}

.topbar{
	position:fixed;
	left:0;
	right:0;
	top:0;
	z-index: 9;
	background-color:rgba(0,0,0,.6);
	color:#fff;
}
.topbar .topbar-content{
	padding:10px 6px;
	display:none;
}
.topbar.active .topbar-content{
	display:block;
}

.container{
	position:absolute;
	top:0;
	right:0;
	bottom:0;
	left:0;
	z-index:1;
	background-color:#f5f5f5;
}

.device{
	width:100%;
	height:100%;
	display:block;
	border:0;
	padding:0;
	margin:0;
	background-color:#f9f9f9;
	position:absolute;
	overflow:auto;
}
.device-content{
	position:absolute;
	top:0;
	right:0;
	bottom:0;
	left:0;
	display:block;
	width:100%;
	height:100%;
	overflow: hidden;
	overflow-y: auto;
	-webkit-overflow-scrolling: touch;
}
.bar-wechat + .device-content{
	padding-top:64px;
}
.device img{max-width:100%;}
.device.iphone4{width:320px;height:480px;}
.device.iphone5{width:320px;height:568px;}
.device.iphone6{width:375px;height:667px;}
.device.iphone6plus{width:414px;height:736px;}
.device.nexus4{width:384px;height:640px;}
.device.nexus5{
	width:360px;
	height:640px;
}

.webview{
	width:100%;
	height:100%;
	display:block;
	border:0;
	padding:0;
	margin:0;
	overflow:auto;
	background-color:#fff;
}

.form-group{
	display:table;
	widows:100%;
	padding-bottom:10px;
}
.form-group>label,
.form-group>.control-group{
	display:table-cell;
}
.form-group>label{
	width:60px;
	padding-right:5px;
	text-align:right;
}
.form-group>label.w80{
	width:80px;
}
.btn-toggle{
	position:absolute;
	left:50%;
	bottom:-22px;
	width:80px;
	height:22px;
	margin-left:-40px;
	text-align:center;
	color:rgba(255,255,255, .5);
	background-color:rgba(0,0,0,.1);
	border-radius:0 0 5px 5px;
}
.btn-toggle:before{
	content:"\5C55\5F00";
	display:block;
	position:absolute;
	top:0;
	right:0;
	bottom:0;
	left:0;
	text-align:center;
}
.topbar.active .btn-toggle:before{
	content:"\6536\8D77";
}
.topbar.active .btn-toggle,
.btn-toggle:hover{
	color:rgba(255,255,255, 1);
	background-color:rgba(0,0,0,.6);
}
.btn-toggle,
.btn-toggle:hover{
	text-decoration:none;
}

.bar{
	position:relative;
	z-index:999;
	border-top-width:20px;
	border-top-style:solid;
	border-top-color:#fff;
	height:64px;
}
.bar:before{
	content:"fulicat.com";
	display:block;
	font-size:12px;
	position:absolute;
	left:0;
	top:-20px;
	padding:0 2px;
}
.bar a{
	text-decoration:none;
}
.bar>.btn-left,
.bar>.btn-right{
	position:absolute;
	top:0px;
	width:44px;
	height:44px;
	line-height:44px;
	display:block;
	text-align:center;
}
.bar>.btn-left{
	left:0;
}
.bar>.btn-left:active,
.bar>.btn-right:active{
	background-color:rgba(255,255,255,.5);
}
.bar>.btn-left:before{
	content:"\20";
	display:inline-block;
	width:8px;
	height:8px;
	border-style:solid;
	border-color:#fff;
	border-width:2px 0 0 2px;
	margin-left:4px;
	-webkit-transform:rotate(-45deg);
}
.bar>.btn-right{
	right:0;
}

.bar>.title{
	margin:0 50px;
	line-height:44px;
	text-align:center;
	font-size:20px;
}

.bar-wechat{
	background-color:#111;
	border-top-color:#111;
	color:#fff;
}
.bar-wechat a{
	color:#fff;
}

.log{
	color:transparent;
}

</style>
</head>
<body ontouchstart="">
<?
if($file){
	$fileinfo = pathinfo($file);
	$ext = strtolower($fileinfo["extension"]);

	$imgExts = array("jpg", "jpeg", "png", "gif", "bmp");

	$device = isset($_COOKIE["device"]) ? trim($_COOKIE["device"]) : "";
	$viewmode = isset($_COOKIE["view"]) ? trim($_COOKIE["view"]) : "";
?>
	<div class="topbar">
		<a class="btn-toggle" href="javascript:void(0)"></a>
		<div class="topbar-content">
			<div class="form-group">
				<label>设备:</label>
				<div class="control-group">
					<select id="device-mode">
						<option value=""<?=($device==""?" selected=\"selected\"":"");?>>默认</option>
						<option value="iphone4"<?=($device=="iphone4"?" selected=\"selected\"":"");?>>Apple iPhone 4</option>
						<option value="iphone5"<?=($device=="iphone5"?" selected=\"selected\"":"");?>>Apple iPhone 5</option>
						<option value="iphone6"<?=($device=="iphone6"?" selected=\"selected\"":"");?>>Apple iPhone 6</option>
						<option value="iphone6plus"<?=($device=="iphone6plus"?" selected=\"selected\"":"");?>>Apple iPhone 6 Plus</option>
						<option value="nexus4"<?=($device=="nexus4"?" selected=\"selected\"":"");?>>Google Nexus 4</option>
						<option value="nexus5"<?=($device=="nexus5"?" selected=\"selected\"":"");?>>Google Nexus 5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label>模式:</label>
				<div class="control-group">
					<select id="view-mode">
						<option value=""<?=($viewmode==""?" selected=\"selected\"":"");?>>默认</option>
						<option value="wechat"<?=($viewmode=="wechat"?" selected=\"selected\"":"");?>>微信</option>
						<!-- <option value="safari"<?=($viewmode=="safari"?" selected=\"selected\"":"");?>>Safari</option> -->
					</select>
				</div>
			</div>
		</div>
	</div>

	
	<section class="container device<?=($device?" ".$device:"");?>">
		<?if($viewmode=="wechat"){?>
			<header class="bar bar-wechat">
				<a class="btn-left" href="javascript:void(0)" id="btn-back">返回</a>
				<h2 class="title">微信</h2>
				<a class="btn-right" href="javascript:void(0)">&bull;&nbsp;&bull;&nbsp;&bull;</a>
			</header>
		<?}?>
		<div class="device-content">
			<?if(in_array($ext, $imgExts)){?>
				<img src="<?=$file;?>" alt="">
			<?}else{?>
				<iframe name="webview" id="webview" class="webview" src="<?=$file;?>"></iframe>
			<?}?>
		</div>
	</section>

<script src="http://lib.sinaapp.com/js/zepto/1.0/zepto.min.js"></script>
<script>
;$.cookie = {
	/**
	* 读取cookie
	*
	* @param {String} n=名称
	* @return {String} cookie值
	* @example
	*$.cookie.get('id_test');
	*/
	get:function(n){
		var m = document.cookie.match(new RegExp( "(^| )"+n+"=([^;]*)(;|$)"));
		return !m ? "" : unescape(m[2]);
	},
	/**
	* 设置cookie
	* @param {String} name cookie名称 --必填
	* @param {String} value cookie值--必填
	* @param {String} domain 所在域名
	* @param {String} path 所在路径
	* @param {Number} hour 存活时间，单位:小时
	* @example
	*$.cookie.set('value1','cookieval',"id.qq.com","/test",24); //设置cookie
	*/
	set:function(opt){
		var $opt = $.extend({name:'', value:'', domain:'', path:'', hour:0}, opt);
		var expire = new Date();
		expire.setTime(expire.getTime() + ($opt.hour ? 3600000 * $opt.hour : 30*24*60*60*1000));
		document.cookie = $opt.name + "=" + $opt.value + "; " + "expires=" + expire.toGMTString()+"; path="+ ($opt.path ? $opt.path :"/")+ "; "+ ($opt.domain ? ("domain=" + $opt.domain + ";") : "");
	}
};
</script>

<script>
function getHash(){
	return location.hash.replace('#', '');
};

var hash = getHash();

function is_weixn(){
	var ua = navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i)=="micromessenger"){
		return true;
	}else{
		return false;
	};
};

$('#btn-back').on('click', function(){
	history.back();
	return false;
});

$('#device-mode').on('change', function(){
	$.cookie.set({
		'name': 'device',
		'value': $(this).val()
	});
	location.reload();
});

$('#view-mode').on('change', function(){
	$.cookie.set({
		'name': 'view',
		'value': $(this).val()
	});
	location.reload();
});

$('.btn-toggle').on('click', function(){
	$(this).parent().toggleClass('active');
	return false;
});
</script>

<?
}else{
	if(count($hash)){
		$html = array();
		array_push($html, "<dl class=\"list list-dir\">");
		array_push($html, "<dt>目录：</dt>");
		if($path!="/"){
			array_push($html, "<dd class=\"parent\"><a href=\"".dirname($uri)."\">上层</a></dd>");
		}
		if(count($hash["dirs"])){
			foreach($hash["dirs"] as $dir){
				array_push($html, "<dd><a href=\"". $dir ."\">". $dir ."</a></dd>");
			}
		}
		array_push($html, "</dl>");
		array_push($html, "<dl class=\"list list-file\">");
		if(count($hash["files"])){
			array_push($html, "<dt>文件：</dt>");
			foreach($hash["files"] as $file){
				array_push($html, "<dd><span class=\"mtime\" title=\"Modified time\">".$file["filemtime"]."</span><a href=\"". $file["name"]."\">".$file["name"]."</a><a class=\"external\" target=\"_blank\" href=\"?". $file["name"]."\"></a></dd>");
			}
		}
		array_push($html, "</dl>");
		echo join("\n", $html);
	}else{
		echo "no files";
	}
}
?>
</body>
</html>