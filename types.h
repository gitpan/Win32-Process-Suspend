typedef LONG (*pNtSuspendProcess )( HANDLE ProcessHandle );
typedef LONG (*pNtResumeProcess )( HANDLE ProcessHandle );
typedef LONG (*pNtSuspendThread) (HANDLE THREADHANDLE, LONG COUNT);
typedef LONG (*pNtResumeThread) (HANDLE THREADHANDLE, LONG COUNT);
pNtSuspendProcess NtSuspendProcess = NULL;
pNtResumeProcess NtResumeProcess = NULL;
pNtSuspendThread NtSuspendThread = NULL;
pNtResumeThread NtResumeThread = NULL;
