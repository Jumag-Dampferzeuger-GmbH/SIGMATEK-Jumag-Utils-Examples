//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "splitDINT"
	Revision           = "0.0"
	GUID               = "{97871922-35C6-4BA3-BD50-4C8EDC9273BA}"
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
	Objectsize         = "(284,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{8F3F39C7-56F4-466C-A54D-8B999FC3AE58}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="iInput" GUID="{B784AE54-188B-49A6-8476-923D71BDF1DE}" Visualized="false" Initialize="true" WriteProtected="false" Retentive="false"/>
		<Server Name="LSB" GUID="{897BABF9-ED27-445E-A585-8F607F7A096B}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="MSB" GUID="{A7D79B67-0E19-41A4-94E6-6E69B09C085C}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Source\typeManipulation.c"/>
		</Files>
	</Dependencies>
</Class>
*)
splitDINT : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	iInput 	: SvrCh_DINT;
	MSB 	: SvrCh_DINT;
	LSB 	: SvrCh_DINT;
  //Clients:
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL RtWork
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


FUNCTION GLOBAL TAB splitDINT::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_SPLITDINT
0$UINT, 0$UINT, (SIZEOF(::splitDINT))$UINT, 
4$UINT, 0$UINT, 0$UINT, 
TO_UDINT(4150147386), "splitDINT", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::splitDINT.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::splitDINT.iInput.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1892416893), "iInput", 
(::splitDINT.MSB.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2387077546), "MSB", 
(::splitDINT.LSB.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2407891869), "LSB", 
//Clients:
END_FUNCTION


#define USER_CNT_splitDINT 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_splitDINT] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION splitDINT::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_splitDINT, pCmd := #vmt.CmdTable);
	vmt.CmdTable.CyWork		:= #CyWork();
	vmt.CmdTable.RtWork		:= #RtWork();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	iInput.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF iInput.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
Function Global __cdecl splitDINT
VAR_INPUT
  IN : DINT;
  MSB : BSINT;
  LSB : BSINT; 
END_VAR
VAR_OUTPUT
  Q : UINT;
END_VAR;


FUNCTION VIRTUAL GLOBAL splitDINT::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  
  

	state := READY;

END_FUNCTION