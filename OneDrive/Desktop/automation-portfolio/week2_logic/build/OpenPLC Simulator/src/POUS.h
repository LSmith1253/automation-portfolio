#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// PROGRAM MAIN
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,INPUT1)
  __DECLARE_VAR(BOOL,INPUT2)
  __DECLARE_VAR(BOOL,START)
  __DECLARE_VAR(BOOL,STOP)
  __DECLARE_VAR(BOOL,OUTPUT1)
  __DECLARE_VAR(BOOL,OUTPUT2)
  __DECLARE_VAR(BOOL,MOTOR)

  // PROGRAM private variables - TEMP, private and located variables

} MAIN;

void MAIN_init__(MAIN *data__, BOOL retain);
// Code part
void MAIN_body__(MAIN *data__);
#endif //__POUS_H
