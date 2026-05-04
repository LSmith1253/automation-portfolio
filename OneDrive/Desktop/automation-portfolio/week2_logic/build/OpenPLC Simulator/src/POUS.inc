#include "POUS.h"
#include "Config0.h"

void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->INPUT1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->INPUT2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STOP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->OUTPUT1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->OUTPUT2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,OUTPUT1,,(__GET_VAR(data__->INPUT1,) && __GET_VAR(data__->INPUT2,)));
  __SET_VAR(data__->,OUTPUT2,,(__GET_VAR(data__->INPUT1,) || __GET_VAR(data__->INPUT2,)));
  if ((__GET_VAR(data__->START,) && !(__GET_VAR(data__->STOP,)))) {
    __SET_VAR(data__->,MOTOR,,__BOOL_LITERAL(TRUE));
  } else if (__GET_VAR(data__->STOP,)) {
    __SET_VAR(data__->,MOTOR,,__BOOL_LITERAL(FALSE));
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





