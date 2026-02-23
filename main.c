#include "stm32l552xx.h"

int main(void) {
    RCC->AHB2ENR |= RCC_AHB2ENR_GPIOCEN;
    volatile uint32_t temp = RCC->AHB2ENR;
    (void)temp;
    //Configure PC7 as push-pull output, low speed, no pull
    GPIOC->MODER &= ~(3U << (7 * 2));
    GPIOC->MODER |= (1U << (7 * 2));
    GPIOC->OTYPER &= ~(1U << 7); // push-pull
    GPIOC->OSPEEDR &= ~(3U << (7 * 2)); // low speed
    GPIOC->PUPDR &= ~(3U << (7 * 2)); // no pull
    while(1) {
        GPIOC->BSRR = (1U << 7); // set PC7 (LED ON)
            for(uint32_t j = 0; j < 400000; j++)
                __NOP();
        GPIOC->BSRR = (1U << (7 + 16)); // reset PC7 (LED OFF)
            for(uint32_t j = 0; j < 400000; j++)
                __NOP();
    }
}