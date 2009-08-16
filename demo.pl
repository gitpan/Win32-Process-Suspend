use Win32::Process::Suspend;

do{
	chomp;
	if($_){
		if(/\D+/ || $_ % 4 > 0){
			print "please enter a valid pid!\n";
		}else{
			my $handle = GetHandle($_);
			print 'Handle: ',$handle;
			print SuspendProcess($handle),"\n";
			print ResumeProcess($handle),"\n";
		}
	}
	print 'pid> ';
}while(<STDIN>);
