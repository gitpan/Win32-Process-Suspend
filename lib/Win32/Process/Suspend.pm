package Win32::Process::Suspend;
require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw(SuspendProcess SuspendThread ResumeProcess ResumeThread GetHandle);
our $VERSION = '0.064';

require XSLoader;
XSLoader::load('Win32::Process::Suspend', $VERSION);
sub SuspendProcess {return map{Win32::Process::Suspend::_SuspendProcess($_)}@_}
sub ResumeProcess {return map{Win32::Process::Suspend::_ResumeProcess($_)}@_}
sub SuspendThread {return map{Win32::Process::Suspend::_SuspendThread($_)}@_}
sub ResumeThread {return map{Win32::Process::Suspend::_ResumeThread($_)}@_}
sub GetHandle {return map{Win32::Process::Suspend::_GetHandle($_)}@_}
return Win32::Process::Suspend::Import();
__END__

=head1 NAME

Win32::Process::Suspend - Suspending Other Process With Perl

=head1 SYNOPSIS

  use Win32::Process::Suspend;
  $handle = GetHandle($pid);
  SuspendProcess($handle);
  #do some thing
  ResumeProcess($handle);
  
=head1 DESCRIPTION

	This module is used for suspending process on Win32.
	Something wrong with the script and XS.
	
	PLEASE ENSURE YOUR C COMPILER'S OPTIMIZER HAD BEEN TURNED OFF

	See Alternation for another method.

=head1 Alternation

	use Win32::API;
	my $SuspendProcess = Win32::API->new('ntdll','NtSuspendProcess',[I],'I');
	my $ResumeProcess = Win32::API->new('ntdll','NtResumeProcess',[I],'I');

=head2 EXPORT

	GetHandle
	SuspendProcess
	SuspendThread
	ResumeProcess
	ResumeThread

=head1 SEE ALSO

	My Mail: rootkwok <AT> cpan <dot> org

=head1 AUTHOR

Baggio, Kwok Lok Chung rootkwok <AT> cpan <dot> org

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Baggio, Kwok Lok Chung

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.
=cut
