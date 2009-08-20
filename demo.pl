use Win32::Process::Suspend;

do{
	chomp;
	if($_){
		if(/\D+/ || $_ % 4 > 0){
			print "please enter a valid pid!\n";
		}else{
			SuspendProcess(GetHandle($_));
		}
	}
	print 'pid> ';
}while(<STDIN>);
