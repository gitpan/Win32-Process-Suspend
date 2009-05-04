typedef LONG (*pNtSuspendProcess )( HANDLE ProcessHandle );
typedef LONG (*pNtResumeProcess )( HANDLE ProcessHandle );
pNtSuspendProcess NtSuspendProcess = NULL;
pNtResumeProcess NtResumeProcess = NULL;
