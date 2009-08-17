use ExtUtils::MakeMaker;

$opt = '-O0';
$opt .= ' -s' if $Config{'cc'} eq 'gcc';

WriteMakefile(
    NAME              => 'Win32::Process::Suspend',
    VERSION_FROM      => 'lib/Win32/Process/Suspend.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Win32/Process/Suspend.pm', # retrieve abstract from module
       AUTHOR         => 'Baggio, Kwok Lok Chung <rootkwok@cpan.org>') : ()),
    INC               => '-I.',
	OPTIMIZE		  => '-O0',
);
