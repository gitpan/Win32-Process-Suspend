#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "main.c"
MODULE = Win32::Process::Suspend		PACKAGE = Win32::Process::Suspend		

int
Import()

int
_SuspendProc(int hProc)

int
_ResumeProc(int hProc)

int
GetHandle(int PID)

int
_SuspendThreads(int hThread)

int
_ResumeThreads(int hThread)
