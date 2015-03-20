#include "srcconf.h"
extern uint16_t vservo0,vservo1,vservo2;

Thread *shelltp = NULL;

/*===========================================================================*/
/* Command line related.                                                     */
/*===========================================================================*/

#define SHELL_WA_SIZE   THD_WA_SIZE(2048)
#define TEST_WA_SIZE    THD_WA_SIZE(256)

static void cmd_ok(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"test\r\n");
    return;
  };
  
  chprintf((BaseSequentialStream *)&SD1,"serial OK!\r\n");
  return;
}

static void cmd_set0(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=1){
    chprintf(chp,"bad commands\r\n");
    return;
  };
  vservo0=atoi(argv[0]);
  return;
}

static void cmd_set1(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=1){
    chprintf(chp,"bad commands\r\n");
    return;
  };
  vservo1=atoi(argv[0]);
  return;
}

static void cmd_set2(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=1){
    chprintf(chp,"bad commands\r\n");
    return;
  };
  vservo2=atoi(argv[0]);
  return;
}

static void cmd_value(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"val\r\n");
    return;
  };

  chprintf((BaseSequentialStream *)&SD1,"%i %i %i\r\n",vservo0,vservo1,vservo2);
  return;
}

static void cmd_grip(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"bad commands\r\n");
    return;
  };

//  vservo0=1500;
  vservo0=500;
  return;
}

static void cmd_ungrip(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"bad commands\r\n");
    return;
  };

//  vservo0=500;
  vservo0=1500;
  return;
}

static void cmd_take(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"bad commands\r\n");
    return;
  };

//  vservo1=1500;
  vservo1=500;
  return;
}

static void cmd_untake(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"bad commands\r\n");
    return;
  };

//  vservo1=500;
  vservo1=1500;
  return;
}

static void cmd_rest(BaseSequentialStream *chp, int argc, char *argv[]) {
  (void)argv;
  if(argc!=0){
    chprintf(chp,"bad commands\r\n");
    return;
  };

  vservo0=0;
  vservo1=0;
  return;
}

static const ShellCommand commands[] = {
  {"test",cmd_ok},
  {"set0",cmd_set0},
  {"set1",cmd_set1},
  {"set2",cmd_set2},
  {"val",cmd_value},
  {"grip",cmd_grip},
  {"ungrip",cmd_ungrip},
  {"take",cmd_take},
  {"untake",cmd_untake},
  {"rest",cmd_rest},
  {NULL, NULL}
};

static const ShellConfig shell_cfg1 = {
  (BaseSequentialStream *)&SD1,
  commands
};

/*
 * =================================================================================
 */

void Shell_Setup(void){
  palSetPadMode(GPIOA,9,16);
  palSetPadMode(GPIOA,10,2);
  sdStart(&SD1,NULL);
  shellInit();
}

void Shell_Create(void){
  if (!shelltp)
   shelltp = shellCreate(&shell_cfg1, SHELL_WA_SIZE, NORMALPRIO);
  else if (chThdTerminated(shelltp)) {
   chThdRelease(shelltp);    /* Recovers memory of the previous shell.   */
   shelltp = NULL;           /* Triggers spawning of a new shell.        */
  }
}

