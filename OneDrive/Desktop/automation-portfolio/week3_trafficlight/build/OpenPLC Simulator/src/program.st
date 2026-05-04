PROGRAM main
  VAR_OUTPUT
    Green : BOOL;
    Amber : BOOL;
    Red : BOOL;
  END_VAR
  VAR
    Timer1 : TON;
    Timer2 : TON;
    Timer3 : TON;
    LightStep : INT;
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


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "8138d14200484e972f656c9b02402efd";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:// Include defines.h first for Arduino builds to set USE_*_BLOCKS macros*)
(*DBG:// before iec_std_FB.h processes its conditional includes*)
(*DBG:#ifdef ARDUINO*)
(*DBG:#include "../examples/Baremetal/defines.h"*)
(*DBG:#endif*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:char plc_program_md5[] = "8138d14200484e972f656c9b02402efd";*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern MAIN RES0__INSTANCE0;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.GREEN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.AMBER), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER1.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER2.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TIMER3.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LIGHTSTEP), INT_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               34*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return sizeof(SINT);*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return sizeof(TIME);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return (void *)&((__IEC_SINT_t *) ptr)->value;*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return (void *)&((__IEC_TIME_t *) ptr)->value;*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case SINT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case TIME_ENUM: {*)
(*DBG:            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case SINT_ENUM:*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case TIME_ENUM:*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size)*)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i)*)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++)*)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Prevent swapping for STRING type*)
(*DBG:            if (debug_vars[idx].type == STRING_ENUM)*)
(*DBG:            {*)
(*DBG:                // Do nothing*)
(*DBG:                ;*)
(*DBG:            }*)
(*DBG:            else*)
(*DBG:            {*)
(*DBG:                swap_bytes(val, get_var_size(idx));*)
(*DBG:            }*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)