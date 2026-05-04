#include "POUS.h"
#include "Config0.h"

void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->GREEN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AMBER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RED,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TIMER1,retain);
  TON_init__(&data__->TIMER2,retain);
  TON_init__(&data__->TIMER3,retain);
  __INIT_VAR(data__->LIGHTSTEP,0,retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  if ((__GET_VAR(data__->LIGHTSTEP,) == 0)) {
    __SET_VAR(data__->,GREEN,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,AMBER,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,RED,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,TIMER1.IN,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,TIMER1.PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
    TON_body__(&data__->TIMER1);
    if (__GET_VAR(data__->TIMER1.Q,)) {
      __SET_VAR(data__->,TIMER1.IN,,__BOOL_LITERAL(FALSE));
      TON_body__(&data__->TIMER1);
      __SET_VAR(data__->,LIGHTSTEP,,1);
    };
  } else if ((__GET_VAR(data__->LIGHTSTEP,) == 1)) {
    __SET_VAR(data__->,GREEN,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,AMBER,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,RED,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,TIMER2.IN,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,TIMER2.PT,,__time_to_timespec(1, 0, 2, 0, 0, 0));
    TON_body__(&data__->TIMER2);
    if (__GET_VAR(data__->TIMER2.Q,)) {
      __SET_VAR(data__->,TIMER2.IN,,__BOOL_LITERAL(FALSE));
      TON_body__(&data__->TIMER2);
      __SET_VAR(data__->,LIGHTSTEP,,2);
    };
  } else if ((__GET_VAR(data__->LIGHTSTEP,) == 2)) {
    __SET_VAR(data__->,GREEN,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,AMBER,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,RED,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,TIMER3.IN,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,TIMER3.PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
    TON_body__(&data__->TIMER3);
    if (__GET_VAR(data__->TIMER3.Q,)) {
      __SET_VAR(data__->,TIMER3.IN,,__BOOL_LITERAL(FALSE));
      TON_body__(&data__->TIMER3);
      __SET_VAR(data__->,LIGHTSTEP,,0);
    };
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





