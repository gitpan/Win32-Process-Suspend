#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "main.c"
MODULE = Win32::Process::Suspend		PACKAGE = Win32::Process::Suspend		

int
Suspend(int hProc)

int
Resume(int hProc)

int
GetHandle(int PID)

int
SuspendT(int hThread)

int
ResumeT(int hThread)
