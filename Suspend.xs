#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

typedef long(*NTSUSPENDPROCESS)(long);
typedef long(*NTRESUMEPROCESS)(long);
typedef long(*NTSUSPENDTHREAD)(long);
typedef long(*NTRESUMETHREAD)(long);
typedef long (*RTLADJUSTPRIVILEGE)(int,bool,bool,int*);
NTSUSPENDPROCESS NtSuspendProcess = NULL;
NTRESUMEPROCESS NtResumeProcess = NULL;
NTSUSPENDTHREAD NtSuspendThread = NULL;
NTRESUMETHREAD NtResumeThread = NULL;
RTLADJUSTPRIVILEGE RtlAdjPriv = NULL;


#include <windows.h>
MODULE = Win32::Process::Suspend		PACKAGE = Win32::Process::Suspend

long
Import ()
	CODE:
		HMODULE ntdll = LoadLibrary("ntdll.dll");
		if(!ntdll)
			RETVAL = 0;
		NtSuspendProcess = (NTSUSPENDPROCESS)GetProcAddress(ntdll,"NtSuspendProcess");
		NtResumeProcess = (NTRESUMEPROCESS)GetProcAddress(ntdll,"NtResumeProcess");
		NtSuspendThread = (NTSUSPENDTHREAD)GetProcAddress(ntdll,"NtSuspendThread");
		NtResumeThread = (NTRESUMETHREAD)GetProcAddress(ntdll,"NtResumeThread");
		RtlAdjPriv = (RTLADJUSTPRIVILEGE)GetProcAddress(ntdll,"RtlAdjustPrivilege");
		FreeLibrary(ntdll);
		{
			int prtn;
			RtlAdjPriv(20,TRUE,FALSE,&prtn);
		}
		RtlAdjPriv = NULL;
		RETVAL = 1;
	OUTPUT:
		RETVAL

long
_SuspendProcess (long hProc)
	CODE:
		RETVAL = (long)NtSuspendProcess((long)hProc);
	OUTPUT:
		RETVAL

long
_ResumeProcess (long hProc)
	CODE:
		RETVAL = (long)NtResumeProcess((long)hProc);
	OUTPUT:
		RETVAL

long
_SuspendThread (long hThread)
	CODE:
		RETVAL = (long)NtSuspendThread((long)hThread);
	OUTPUT:
		RETVAL

long
_ResumeThread (long hThread)
	CODE:
		RETVAL = (long)NtResumeThread((long)hThread);
	OUTPUT:
		RETVAL

long
GetHandle (long PID)
	CODE:
		RETVAL = (long)OpenProcess((long)PROCESS_ALL_ACCESS,(long)TRUE,(long)PID);
	OUTPUT:
		RETVAL
