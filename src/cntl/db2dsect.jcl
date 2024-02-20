//DB2DSECT JOB 'COMPILE DB2DSECT',
//             CLASS=K,MSGCLASS=X,NOTIFY=&SYSUID,REGION=0M
//*====================================================================*
//* COMPILE PROGRAM DB2DSECT                                           *
//*                                                                    *
//* AUTHOR: ADHA                                                       *
//*====================================================================*
//         SET HLQ=&SYSUID..DB2
//         SET DB2VRS=13
//         SET DB2HLQ=DSN&DB2VRS.10
//         SET PGM=DB2DSECT
//*--------------------------------------------------------------------*
//* PRE-COMPILE THE ASSEMBLER PROGRAM                                  *
//*--------------------------------------------------------------------*
//PC       EXEC PGM=DSNHPC,
//             PARM='HOST(ASM),CCSID(273)',REGION=4096K
//DBRMLIB  DD DSN=&HLQ..DBRMLIB(&PGM),DISP=SHR
//STEPLIB  DD DSN=&DB2HLQ..SDSNEXIT,DISP=SHR
//         DD DSN=&DB2HLQ..SDSNLOAD,DISP=SHR
//SYSCIN   DD DSN=&&SYSIN,DISP=(,PASS),UNIT=SYSDA,
//         SPACE=(800,(500,500))
//SYSIN    DD DSN=&HLQ..ASM.SRCE(&PGM),DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SYSTERM  DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSUT1   DD  SPACE=(800,(500,500),,,ROUND),UNIT=SYSDA
//*
//*--------------------------------------------------------------------*
//* COMPILE THE ASSEMBLER PROGRAM                                      *
//*--------------------------------------------------------------------*
//COMPILE  EXEC ASMACL,PARM.C=ADATA,
//         MAC2=&DB2HLQ..SDSNMACS
//C.SYSIN    DD DSN=&&SYSIN,DISP=(OLD,DELETE)
//C.SYSADATA DD DSN=&HLQ..ADATA(&PGM),DISP=SHR
//L.SYSLMOD  DD DSN=&HLQ..LOAD(&PGM),DISP=SHR
//
