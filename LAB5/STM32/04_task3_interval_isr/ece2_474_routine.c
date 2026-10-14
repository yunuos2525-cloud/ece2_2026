#include "ece2_474.h"
#include "main.h"

/* button_isr_p7() is the only writer; tim6_isr_p4() takes a snapshot. */
static volatile uint8_t requested_interval_index = 0U;
static const uint16_t interval_ticks[4] = {10U, 20U, 40U, 80U};

void ece2_474_init(void)
{
    HAL_TIM_Base_Start_IT(&htim6);
}

void polling_routine(void)
{
    /* Button and timing behavior are handled by interrupts. */
}

static void button_isr_p7(void)
{
    static uint32_t last_ms = 0U;
    uint32_t now_ms = HAL_GetTick();

    if (now_ms - last_ms >= 200U)
    {
        last_ms = now_ms;
        requested_interval_index = (uint8_t)((requested_interval_index + 1U) % 4U);
    }
}

static void tim6_isr_p4(void)
{
    static uint8_t active_interval_index = 0U;
    static uint16_t elapsed_ticks = 0U;
    uint8_t requested = requested_interval_index;

    if (requested != active_interval_index)
    {
        active_interval_index = requested;
        /* Policy: an accepted interval change restarts a full new interval. */
        elapsed_ticks = 0U;
        return;
    }

    elapsed_ticks++;
    if (elapsed_ticks >= interval_ticks[active_interval_index])
    {
        elapsed_ticks = 0U;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
    }
}

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
