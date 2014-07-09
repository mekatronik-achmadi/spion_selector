/*
    ChibiOS/RT - Copyright (C) 2006-2013 Giovanni Di Sirio

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

#include "srcconf.h"

#define run 3
#define run_on palClearPad(GPIOC,run)
#define run_off palSetPad(GPIOC,run)

#define servo0 0
#define servo0_off palClearPad(GPIOC,servo0)
#define servo0_on palSetPad(GPIOC,servo0)

#define servo1 1
#define servo1_off palClearPad(GPIOC,servo1)
#define servo1_on palSetPad(GPIOC,servo1)

#define servo2 2
#define servo2_off palClearPad(GPIOC,servo2)
#define servo2_on palSetPad(GPIOC,servo2)

#define loopmax 2000
uint16_t vservo0,vservo1,vservo2;

static WORKING_AREA(wa_servo0Thread, 128);
static msg_t servo0Thread(void *arg) {
  (void)arg;
  while (TRUE) {
    
      servo0_on;
      chThdSleepMicroseconds(vservo0);

      servo0_off;
      chThdSleepMicroseconds(loopmax-vservo0);

  }
  return 0;
}

static WORKING_AREA(wa_servo1Thread, 128);
static msg_t servo1Thread(void *arg) {
  (void)arg;
  while (TRUE) {

      servo1_on;
      chThdSleepMicroseconds(vservo1);

      servo1_off;
      chThdSleepMicroseconds(loopmax-vservo1);

  }
  return 0;
}

static WORKING_AREA(wa_servo2Thread, 128);
static msg_t servo2Thread(void *arg) {
  (void)arg;
  while (TRUE) {

      servo2_on;
      chThdSleepMicroseconds(vservo2);

      servo2_off;
      chThdSleepMicroseconds(loopmax-vservo2);

  }
  return 0;
}

int main(void) {

  halInit();
  chSysInit();

  palSetPadMode(GPIOC,3,PAL_MODE_OUTPUT_PUSHPULL);
  palSetPad(GPIOC,3);
  
  vservo0=1500;
  vservo1=1500;
  vservo2=1500;
  
  palSetPadMode(GPIOC,0,PAL_MODE_OUTPUT_PUSHPULL);
  palSetPadMode(GPIOC,1,PAL_MODE_OUTPUT_PUSHPULL);
  palSetPadMode(GPIOC,2,PAL_MODE_OUTPUT_PUSHPULL);
  chThdCreateStatic(wa_servo0Thread, sizeof(wa_servo0Thread), NORMALPRIO, servo0Thread, NULL);
  chThdCreateStatic(wa_servo1Thread, sizeof(wa_servo1Thread), NORMALPRIO, servo1Thread, NULL);
  chThdCreateStatic(wa_servo2Thread, sizeof(wa_servo2Thread), NORMALPRIO, servo2Thread, NULL);

  Shell_Setup();

  while (TRUE) {
    Shell_Create();
    palTogglePad(GPIOC,3);
    chThdSleepMilliseconds(100);
  }
}
