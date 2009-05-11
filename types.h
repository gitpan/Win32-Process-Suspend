typedef LONG (*pNtSuspendProcess )( int ProcessHandle );
typedef LONG (*pNtResumeProcess )( int ProcessHandle );
typedef LONG (*pNtSuspendThread) (int THREADHANDLE, LONG COUNT);
typedef LONG (*pNtResumeThread) (int THREADHANDLE, LONG COUNT);
pNtSuspendProcess NtSuspendProcess = NULL;
pNtResumeProcess NtResumeProcess = NULL;
pNtSuspendThread NtSuspendThread = NULL;
pNtResumeThread NtResumeThread = NULL;
