#include "srcconf.h"

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
  
  chprintf((BaseSequentialStream *)&SD1,"serial OK!");
  return;
}

static const ShellCommand commands[] = {
  {"test",cmd_ok},
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

