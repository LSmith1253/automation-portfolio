#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// PROGRAM MAIN
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,GREEN)
  __DECLARE_VAR(BOOL,AMBER)
  __DECLARE_VAR(BOOL,RED)

  // PROGRAM private variables - TEMP, private and located variables
  TON TIMER1;
  TON TIMER2;
  TON TIMER3;
  __DECLARE_VAR(INT,LIGHTSTEP)

} MAIN;

void MAIN_init__(MAIN *data__, BOOL retain);
// Code part
void MAIN_body__(MAIN *data__);
#endif //__POUS_H
