#include <stdbool.h>

#define STM32WB55xx

#include "stm32wbxx.h"


#define BIT(i) (1UL << (i))


void spin(uint32_t ticks) { while(ticks > 0) ticks--; }

static bool led_on = false;

void do_test_blinky() {
    RCC->AHB2ENR |= BIT(1);

    GPIOB->MODER &= ~(3UL << 2 * 0);
    GPIOB->MODER |= 1UL << 2 * 0;

    while(true) {
        if (led_on) {
            led_on = false;

            GPIOB->BSRR &= ~BIT(0);
            GPIOB->BSRR |= BIT(16);
        } else {
            led_on = true;

            GPIOB->BSRR &= ~BIT(16);
            GPIOB->BSRR |= BIT(0);
        }

        spin(99999);
    }
}


__attribute__((naked, noreturn)) void _reset(void) {
    do_test_blinky();
}

extern void _estack(void);  // Defined in link.ld

// 16 standard and 63 STM32WB55-specific handlers
__attribute__((section(".vectors"))) void (*const tab[16 + 63])(void) = {
  _estack, _reset, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
};
