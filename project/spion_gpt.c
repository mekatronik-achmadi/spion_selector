#include "srcconf.h"

static void gpt1cb(GPTDriver *gptp) {
  (void)gptp;
}

static const GPTConfig gpt1cfg = {
  F_GPT,    /* 10kHz timer clock.*/
  gpt1cb,   /* Timer callback.*/
  0
};

void Gpt_Setup(void){
	gptStart(&GPTD1, &gpt1cfg);
}
