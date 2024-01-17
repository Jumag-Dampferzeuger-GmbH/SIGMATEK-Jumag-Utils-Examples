//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Class0"
	Revision           = "0.0"
	GUID               = "{4B3A74DB-1216-4046-8D22-2BFFC2432862}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	DefCyclictime      = "100 ms"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(660,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{37DEEEF9-E9CF-42BE-9FD3-3CADDDC26BDE}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="fallingTriggered" GUID="{0698D730-1B7E-4787-8F0A-6EE8DF2EA18F}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="risingTriggered" GUID="{E242BC10-09B4-4E91-B2EB-0CB068B31A3D}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="targetValue" GUID="{F191EE6C-FBD2-4AFC-8120-1550DC4A5690}" Visualized="false" Initialize="true" WriteProtected="false" Retentive="false"/>
		<Client Name="signal" Required="true" Internal="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Source\edgeDetection.c"/>
		</Files>
	</Dependencies>
</Class>
*)
Class0 : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	targetValue 	: SvrCh_DINT;
	risingTriggered 	: SvrCh_DINT;
	fallingTriggered 	: SvrCh_DINT;
  //Clients:
	signal 	: CltCh_DINT;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Class0::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_CLASS0
0$UINT, 0$UINT, (SIZEOF(::Class0))$UINT, 
4$UINT, 1$UINT, 0$UINT, 
TO_UDINT(1594949027), "Class0", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Class0.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::Class0.targetValue.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4828278), "targetValue", 
(::Class0.risingTriggered.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3508314341), "risingTriggered", 
(::Class0.fallingTriggered.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3578830845), "fallingTriggered", 
//Clients:
(::Class0.signal.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2230604403), "signal", 
END_FUNCTION


#define USER_CNT_Class0 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Class0] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Class0::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Class0, pCmd := #vmt.CmdTable);
	vmt.CmdTable.CyWork		:= #CyWork();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	targetValue.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF targetValue.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	risingTriggered.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF risingTriggered.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	fallingTriggered.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF fallingTriggered.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
Function Global __cdecl rTrig_DINT
VAR_INPUT 
  inputSignal : DINT;
  prevSignal : ^DINT;
  triggerVal : DINT;
END_VAR
VAR_OUTPUT
  result : BOOL;
END_VAR;

Function Global __cdecl fTrig_DINT
VAR_INPUT
  inputSignal : DINT;
  prevSignal : ^DINT;
  triggerVal : DINT;
END_VAR
VAR_OUTPUT
  result : BOOL;
END_VAR;

FUNCTION VIRTUAL GLOBAL Class0::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  VAR
  	oldSignal0 : ^DINT; 
    oldSignal1 : ^DINT; 
  END_VAR
  
  signal := signal.Read();
  
  risingTriggered := rTrig_DINT(inputSignal:= signal, prevSignal:= oldSignal0, triggerVal:= targetValue);

  fallingTriggered := fTrig_DINT(inputSignal:= signal, prevSignal:= oldSignal1, triggerVal:= targetValue);
  
	state := READY;

END_FUNCTION

