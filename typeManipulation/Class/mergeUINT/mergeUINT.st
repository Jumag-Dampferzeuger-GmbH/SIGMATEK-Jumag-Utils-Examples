//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "mergeUINT"
	Revision           = "0.0"
	GUID               = "{CB4A694B-60BD-4974-A645-6F04451BF514}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	DefCyclictime      = "10 ms"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(660,300)">
	<Channels>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\Source\typeManipulation.c"/>
		</Files>
	</Dependencies>
	<Network Name="mergeUINT">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{B02509D0-0E3B-4367-9905-D604E0E804BA}"
				Class      = "mergeBSINT"
				Position   = "(218,120)"
				Visualized = "false">
				<Channels>
					<Server Name="ClassSvr"/>
					<Server Name="LSB"/>
					<Server Name="merged"/>
					<Server Name="MSB"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.ClassSvr" Destination="_base.ClassSvr" Vertices="(690,210),(518,210),"/>
			<Connection Source="this.merged" Destination="_base.merged" Vertices="(690,270),(518,270),"/>
			<Connection Source="this.MSB" Destination="_base.MSB" Vertices="(690,330),(518,330),"/>
			<Connection Source="this.LSB" Destination="_base.LSB" Vertices="(690,390),(518,390),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using mergeBSINT

mergeUINT : CLASS
: mergeBSINT
  //Servers:
  //Clients:
  //Variables:
		mMSB 	: UINT;
		mLSB 	: UINT;
		mMerged 	: UDINT;
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


FUNCTION GLOBAL TAB mergeUINT::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_MERGEUINT
0$UINT, 0$UINT, (SIZEOF(::mergeUINT))$UINT, 
0$UINT, 0$UINT, 0$UINT, 
TO_UDINT(533305277), "mergeUINT", //Class
TO_UDINT(1405971697), "mergeBSINT", 0$UINT, 0$UINT, //Baseclass
//Servers:
//Clients:
END_FUNCTION


#define USER_CNT_mergeUINT 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_mergeUINT] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION mergeUINT::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= mergeBSINT::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= mergeBSINT::ClassSvr.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, mergeBSINT::ClassSvr.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT_mergeUINT;
	vmt.CmdTable.CyWork		:= #CyWork();
	mergeBSINT::ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF mergeBSINT::ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION
Function Global __cdecl mergeUINT
VAR_INPUT
  MSB : UINT;
  LSB : UINT; 
END_VAR
VAR_OUTPUT
  Q : UDINT;
END_VAR;

FUNCTION VIRTUAL GLOBAL mergeUINT::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  mMSB := to_uint(MSB);
  mLSB := to_uint(LSB); 
  
  mMerged  := mergeUINT(MSB:=mMSB, LSB:=mLSB);
  
  merged := to_dint(mMerged);

	state := READY;

END_FUNCTION
