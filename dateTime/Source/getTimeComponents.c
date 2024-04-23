/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getSecondsFromSysTime
VAR_INPUT
  HEX_SYSTIME : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/

extern "C" int getSecondsFromSysTime(long int iTime)
{
    return (iTime >> 8) & 0xFF;
}
/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getMinutesFromSysTime
VAR_INPUT
  HEX_SYSTIME : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" int getMinutesFromSysTime(long int iTime)
{
    return (iTime >> 16) & 0xFF;
}
/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getHoursFromSysTime
VAR_INPUT
  HEX_SYSTIME : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" int getHoursFromSysTime(long int iTime)
{
    return (iTime >> 24) & 0xFF;
}
/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getDayFromSysDate
VAR_INPUT
  HEX_SYSDATE : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" int getDayFromSysDate(long int iTime)
{
    return (iTime >> 4) & 0xFF;
}
/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getMonthFromSysDate
VAR_INPUT
  HEX_SYSDATE : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" int getMonthFromSysDate(long int iTime)
{
    return (iTime >> 12) & 0xF;
}
/*DECLARATION IN LASAL CLASS 2


Function Global __cdecl getYearFromSysDate
VAR_INPUT
  HEX_SYSDATE : HDINT;
END_VAR
VAR_OUTPUT
  Q : DINT;
END_VAR;

*/
extern "C" int getYearFromSysDate(long int iTime)
{
    return (iTime >> 16) & 0xFFFF;
}
