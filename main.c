#include <windows.h>
#include "types.h"

int Import () {
	HMODULE ntdll = LoadLibrary("ntdll.dll");
	if (ntdll){
		NtSuspendProcess = (pNtSuspendProcess)GetProcAddress(ntdll, "NtSuspendProcess");
		NtResumeProcess = (pNtResumeProcess)GetProcAddress(ntdll, "NtResumeProcess");
		NtSuspendThread = (pNtSuspendThread)GetProcAddress(ntdll, "NtSuspendThread");
		NtResumeThread= (pNtResumeThread)GetProcAddress(ntdll, "NtResumeThread");
		FreeLibrary(ntdll);
		return 1;
	}else{
		return 0;
	}
}

int _SuspendProc (int hProc){
	(int)NtSuspendProcess(hProc);
	return 1;
}

int _ResumeProc (int hProc) {
	(int)NtResumeProcess(hProc);
	return 1;
}

int _ResumeThreads (int hThread) {
	(int)NtResumeThread(hThread, 0);
	return 1;
}

int _SuspendThreads (int hThread) {
	(int)NtResumeThread(hThread, 0);
	return 1;
}

int GetHandle (int PID) {
	PID += 3;
	return (int)OpenProcess(PROCESS_ALL_ACCESS, 0, PID);
}
