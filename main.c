#include <windows.h>
#include "types.h"

int Suspend (int hProc){
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
	NtSuspendProcess = (pNtSuspendProcess)GetProcAddress(ntdll, "NtSuspendProcess" );
	FreeLibrary(ntdll);
	return (int)NtSuspendProcess((int)hProc);
}

int Resume (int hProc) {
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
        NtResumeProcess = (pNtResumeProcess)GetProcAddress(ntdll, "NtResumeProcess" );
	FreeLibrary(ntdll);
	return (int)NtResumeProcess((int)hProc);
}

int ResumeT (int hThread) {
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
        NtResumeThread= (pNtResumeThread)GetProcAddress(ntdll, "NtResumeThread" );
	FreeLibrary(ntdll);
	return (int) NtResumeThread((int)hThread, NULL);
}

int SuspendT (int hThread) {
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
        NtSuspendThread = (pNtSuspendThread)GetProcAddress(ntdll, "NtSuspendThread" );
	FreeLibrary(ntdll);
	return (int) NtResumeThread((int)hThread, NULL);
}

int GetHandle (int PID) {
	PID += 3;
	return (int)OpenProcess(PROCESS_ALL_ACCESS, 0, (int)PID);
}
