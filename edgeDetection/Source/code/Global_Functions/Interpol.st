#ifdef _LSL_TARGETARCH_ARM 

FUNCTION Interpol_D
VAR_INPUT
	ptr		      : ^UDINT;
	value_In		:  UDINT;
END_VAR
VAR_OUTPUT
	value_Out		:  DINT;
END_VAR
VAR
	No_bP       :  UDINT;
  value_nr    :  UDINT;
  rest        :  UDINT;
END_VAR


  if value_In < (ptr+4)^ then
  
    No_bP    := (ptr+4)^ / (ptr+8)^;  // number of basepoints
    value_nr := value_in / No_bP;
    rest     := value_in mod No_bP;
    
    ptr += (value_nr * 4);
    
    value_Out := TO_DINT(((((ptr+16)^ - (ptr+12)^) * rest) / No_bP) + (ptr+12)^);
  
  else
  
    value_out := TO_DINT((ptr+4)^);
  
  end_if;

END_FUNCTION //GLOBAL Interpol_D

#else

FUNCTION AWL Interpol_D
VAR_INPUT
	ptr		: ^UDINT;
	value_In		: UDINT;
END_VAR
VAR_OUTPUT
	value_Out		: DINT;
END_VAR

         PUSH      EDI
         PUSH      EBX
         PUSH      EDX

         L.EDI     ptr
         L.EAX     value_in

         CMP.EAX  (EDI+004)
         JB        _D_IPOL1
         L.EAX    (EDI+004)
         JMP       _D_IPOLEND

_D_IPOL1 XCH.EAX   EBX
         L.EAX    (EDI+004)            // maximum value
		 CLR       EDX
         DIV.D    (EDI+008)            //  / number of basepoints  
		         
		 XCH.EAX   EBX                 // EBX = Teilungsfaktor

         CLR       EDX                 // int (x/Teilung) = value nr
         DIV       EBX

         SHL.EAX   0000000002          // 4 Byte / value
         ADD.edI    EAX

         L.EAX    (EDI+016)            // n1 -n
         SUB.EAX  (EDI+012)
         MUL       EDX                 // rest
         DIV       EBX
         ADD.EAX  (edi+012)

_D_IPOLEND
         POP       EDI
         POP       EDX
         POP       EBX

         S.EAX     value_out
END_FUNCTION //GLOBAL Interpol_D

#endif
