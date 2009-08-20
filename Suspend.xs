#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

typedef DWORD(*NTSUSPENDPROCESS)(HANDLE);
typedef DWORD(*NTRESUMEPROCESS)(HANDLE);
typedef DWORD(*NTSUSPENDTHREAD)(HANDLE);
typedef DWORD(*NTRESUMETHREAD)(HANDLE);
typedef void (*pRtlAdjustPrivilege)(int,BOOL,BOOL,int*);
NTSUSPENDPROCESS NtSuspendProcess = NULL;
NTRESUMEPROCESS NtResumeProcess = NULL;
NTSUSPENDTHREAD NtSuspendThread = NULL;
NTRESUMETHREAD NtResumeThread = NULL;
pRtlAdjustPrivilege RtlAdjPriv = NULL;

MODULE = Win32::Process::Suspend		PACKAGE = Win32::Process::Suspend

bool
Import()
PREINIT:
	int prtn;
CODE:
	HMODULE ntdll = LoadLibrary("ntdll.dll");
	NtSuspendProcess = (NTSUSPENDPROCESS)GetProcAddress(ntdll,"ZwSuspendProcess");
	NtResumeProcess = (NTRESUMEPROCESS)GetProcAddress(ntdll,"ZwResumeProcess");
	NtSuspendThread = (NTSUSPENDTHREAD)GetProcAddress(ntdll,"ZwSuspendThread");
	NtResumeThread = (NTRESUMETHREAD)GetProcAddress(ntdll,"ZwResumeThread");
	RtlAdjPriv = (pRtlAdjustPrivilege) GetProcAddress(ntdll,"RtlAdjustPrivilege");
	FreeLibrary(ntdll);
	{
		int prtn;
		RtlAdjPriv(20,TRUE,FALSE,&prtn);
	}
	RtlAdjPriv = NULL;
	RETVAL = TRUE;
OUTPUT:
	RETVAL

long
_SuspendProcess(int hProc)
CODE:
	RETVAL = (long)NtSuspendProcess((HANDLE)hProc);
OUTPUT:
	RETVAL


long
_ResumeProcess(int hProc)
CODE:
	RETVAL = (long)NtResumeProcess((HANDLE)hProc);
OUTPUT:
	RETVAL


long
_SuspendThread(int hThread)
CODE:
	RETVAL = (long)NtSuspendThread((HANDLE)hThread);
OUTPUT:
	RETVAL


long
_ResumeThread(int hThread)
CODE:
	RETVAL = (long)NtResumeThread((HANDLE)hThread);
OUTPUT:
	RETVAL


int
_GetHandle(int PID)
CODE:
	PID += 3;
	RETVAL = (int)OpenProcess((DWORD)PROCESS_ALL_ACCESS,FALSE,(DWORD)PID);
OUTPUT:
	RETVAL
