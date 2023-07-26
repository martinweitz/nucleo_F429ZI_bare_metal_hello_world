/**
  ******************************************************************************
  * @file    main.c
  * @author Martin Weitz
  * @version V1.0
  * @brief   Default main function.
  ******************************************************************************
*/



#include<stdio.h>
#include<stdint.h>




uint32_t martin = 44;
uint32_t steffi = 43;
uint32_t leonie = 9;

uint32_t cnt = 0;

// semihosting init function
//extern void initialise_monitor_handles(void);

int main(void)
{
  
  //initialise_monitor_handles();
 

  //uint32_t cnt = 0;
  

  printf("Hello World!\n");

	while(cnt<21) {
		cnt++;
    if (cnt==19)
    {
      cnt = 0;
    }
	}

	return 0;
}

