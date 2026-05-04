PROGRAM main
VAR_OUTPUT
	Green : bool;
	Amber : bool;
	Red : bool;
END_VAR

VAR
	Timer1 : TON;
	Timer2 : TON;
	Timer3 : TON;
	LightStep : int;
END_VAR

IF LightStep = 0 THEN
    Green := TRUE;
    Amber := FALSE;
    Red := FALSE;
    Timer1.IN := TRUE;
    Timer1.PT := T#5S;
    Timer1();
    IF Timer1.Q THEN
        Timer1.IN := FALSE;
        Timer1();
        LightStep := 1;
    END_IF;
ELSIF LightStep = 1 THEN
    Green := FALSE;
    Amber := TRUE;
    Red := FALSE;
    Timer2.IN := TRUE;
    Timer2.PT := T#2S;
    Timer2();
    IF Timer2.Q THEN
        Timer2.IN := FALSE;
        Timer2();
        LightStep := 2;
    END_IF;
ELSIF LightStep = 2 THEN
    Green := FALSE;
    Amber := FALSE;
    Red := TRUE;
    Timer3.IN := TRUE;
    Timer3.PT := T#5S;
    Timer3();
    IF Timer3.Q THEN
        Timer3.IN := FALSE;
        Timer3();
        LightStep := 0;
    END_IF;
END_IF;

END_PROGRAM