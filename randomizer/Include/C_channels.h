//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
typedef struct SvrCh_DINT 
  {
    CHMETH *pMeth;
    DINT dData;
    SVRDSC *pDsc;
  } SvrCh_DINT;

typedef struct CltCh_DINT 
  {
    struct SvrCh_DINT *pCh;
    DINT dData;
    SVRCHCMD *pCmd;
  } CltCh_DINT;

typedef struct SvrChCmd_DINT 
  {
    CMDMETH *pMeth;
    DINT dData;
    SVRDSC *pDsc;
  } SvrChCmd_DINT;

typedef struct CltChCmd__TaskObjectControl 
  {
    struct SvrChCmd_DINT *pCh;
    DINT dData;
    _TaskObjectControl *pCmd;
  } CltChCmd__TaskObjectControl;

typedef struct CltChCmd_Ar_Sinus 
  {
    struct SvrChCmd_DINT *pCh;
    DINT dData;
    Ar_Sinus *pCmd;
  } CltChCmd_Ar_Sinus;

typedef struct CltChCmd_Interpolate50_D 
  {
    struct SvrChCmd_DINT *pCh;
    DINT dData;
    Interpolate50_D *pCmd;
  } CltChCmd_Interpolate50_D;

typedef struct SvrCh_UDINT 
  {
    CHMETH *pMeth;
    UDINT dData;
    SVRDSC *pDsc;
  } SvrCh_UDINT;

typedef struct SvrChCmd_SignalType 
  {
    CMDMETH *pMeth;
    SignalType dData;
    SVRDSC *pDsc;
  } SvrChCmd_SignalType;
