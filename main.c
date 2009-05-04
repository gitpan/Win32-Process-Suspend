#include <windows.h>
#include "types.h"

int Suspend (int hProc){
	HANDLE hProcess = NULL;
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
	NtSuspendProcess = (pNtSuspendProcess)GetProcAddress(ntdll, "NtSuspendProcess" );
	FreeLibrary(ntdll);
	return (int)NtSuspendProcess((int)hProc);
}

int Resume (int hProc) {
	HANDLE hProcess = NULL;
	HMODULE ntdll = NULL;
	ntdll = LoadLibrary( "ntdll.dll" );
	if (!ntdll){return 0;}
        NtResumeProcess = (pNtResumeProcess)GetProcAddress(ntdll, "NtResumeProcess" );
	FreeLibrary(ntdll);
	return (int)NtResumeProcess((int)hProc);
}

int GetHandle (int PID) {
	PID += 3;
	return (int)OpenProcess(PROCESS_ALL_ACCESS, 0, (int)PID);
}
