#include "ece2_474.h"
#include "main.h"

void ece2_474_init(void)
{
    /* The PC13 EXTI interrupt is already enabled by MX_GPIO_Init(). */
}

void polling_routine(void)
{
    /* This example is interrupt-driven. */
}

static void button_isr_p7(void)
{
    static uint32_t last_ms = 0U;
    uint32_t now_ms = HAL_GetTick();

    if (now_ms - last_ms >= 200U)
    {
        last_ms = now_ms;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
    }
}

static void tim6_isr_p4(void) { }
static void uart2_isr_p6(void) { }
static void uart3_isr_p5(void) { }
static void gpio_in_pullup_isr_p8_ece2(void) { }
static void gpio_in_pulldown_isr_p9_ece2(void) { }

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == BUTTON_ece2_Pin)
        button_isr_p7();
    else if (GPIO_Pin == GPIO_IN_PULLUP_ece2_Pin)
        gpio_in_pullup_isr_p8_ece2();
    else if (GPIO_Pin == GPIO_IN_PULLDOWN_ece2_Pin)
        gpio_in_pulldown_isr_p9_ece2();
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM6)
        tim6_isr_p4();
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART2)
        uart2_isr_p6();
    else if (huart->Instance == USART3)
        uart3_isr_p5();
}
