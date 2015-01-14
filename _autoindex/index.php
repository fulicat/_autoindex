<?php
/**
 * autoindex for nginx
 * @authors Jack.Chan (fulicat@qq.com)
 * @date    2015-01-12 17:34:45
 * @update  2015-01-13 22:08:05
 * @version 1.4
 * ----- config -----
 * nginx : in nginx.conf set for example:
 * index  index.html  index.php  /_autoindex/index.php;
 * 
 * virtual directory config
 * index  index.html  index.php  #virtual directory#/_autoindex/index.php;
 */

date_default_timezone_set("Asia/Shanghai"); 

header("Content-type: text/html; charset=utf-8");

$version = "1.4";

// ignores
$ignores = array(
	//"list"=> array("index.php", "index.tpl"),
	"list"=> array(),
	"all"=> array("_autoindex", ".svn", ".DS_Store")
);

// Virtual Directory
$virtual_directory = array("/sync");

// functions
function filter_url($url=""){
	$url = str_replace("../", "", $url);
	$url = str_replace("..\\", "", $url);
	$url = str_replace("\\", "/", $url);
	return $url;
}

$root = dirname(dirname(__FILE__));
$uri = isset($_SERVER['REQUEST_URI']) ? urldecode($_SERVER['REQUEST_URI']) : "";

$file = "";
if(strpos($uri, "?")!==false){
	$tmpArr = explode("?", $uri);
	$path = $tmpArr[0];
	$file = filter_url($tmpArr[1]);
}else{
	$path = $uri;
}

// replace virtual directory
$path = strtolower($path); // tolower
$path = str_replace($virtual_directory, "", $path);

$full_path = $root. $path;

switch ($file){
	case 'version':
		echo "<h3>version: ". $version ."</h3>";
		echo "<p>Copyright &copy; Jack.Chan 2014.</p>";
		die();
		break;
	case 'debug':
		echo "<h3>debug</h3>";
		echo "<p>\$uri: ". $uri ."</p>";
		echo "<p>\$root:". $root ."</p>";
		echo "<p>\$file:". $file ."</p>";
		echo "<p>DOCUMENT_ROOT: ". $_SERVER['DOCUMENT_ROOT'] ."</p>";
		echo "<p>\$full_path: ". $full_path ."</p>";
		die();
		break;
	default:
		break;
}

if(!file_exists($full_path.$file)){
	$file = "";
}

function listDir($dir){
	global $ignores;
	$ret = array(
		"dirs" => array(),
		"files" => array()
	);

	$dir = str_replace("\\", "/", $dir);
	if(!file_exists($dir) || !is_dir($dir)){
		return $ret;
	}
	
	if($dir=="./"){
		$ignores = array_merge($ignores["list"], $ignores["all"]);
	}else{
		$ignores = $ignores["all"];
	}

	$path = $dir;
	$dir = opendir($dir);
	while($file = readdir($dir)){
		if($file!=='.' && $file!=='..'){
			if(is_dir("$path/$file")){
				if(!in_array($file, $ignores, TRUE)){
					array_push($ret["dirs"], $file);
				};
			}else{
				//$fname = mb_convert_encoding($file, "UTF-8", "GBK");
				$fname = $file;
				if(!in_array($file, $ignores, TRUE)){
					array_push($ret["files"], array(
							"name" => $fname,
							"size" => filesize("$path/$file"),
							"fileatime" => date("Y-m-d H:i:s", fileatime("$path/$file")),
							"filemtime" => date("Y-m-d H:i:s", filemtime("$path/$file"))
						)
					);
				}
			}
		}
	}
	closedir($dir);
	return $ret;
};

$hash = listDir($full_path);
include_once("index.tpl");

?>