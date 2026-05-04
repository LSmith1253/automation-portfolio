PROGRAM main
VAR_INPUT
	Input1 : bool;
	Input2 : bool;
	Start : bool;
	Stop : bool;
END_VAR

VAR_OUTPUT
	Output1 : bool;
	Output2 : bool;
	Motor : bool;
END_VAR

Output1 := Input1 AND Input2;

(* This turns Output1 ON only when both Input1 AND Input2 are ON *)
(* Like a safety interlock - both doors must be closed before motor starts *)

(* OR Logic - Output2 turns ON when EITHER Input1 OR Input2 is ON *)
Output2 := Input1 OR Input2;

(* Latch circuit - START button turns motor on, STOP turns it off *)
(* Motor holds itself on even after START is released *)
IF Start AND NOT Stop THEN
    Motor := TRUE;
ELSIF Stop THEN
    Motor := FALSE;
END_IF;

END_PROGRAM