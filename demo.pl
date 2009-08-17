use Win32::Process::Suspend;
=pod
my @pids = qw(3580);
my @Handles = GetHandle(@pids);
SuspendProcess(@Handles);
@Handles = @pids = ();
=cut
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
