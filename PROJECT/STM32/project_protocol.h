#ifndef PROJECT_PROTOCOL_H
#define PROJECT_PROTOCOL_H

#include <stdint.h>

/* PROPOSED Week 1 command values. They are not a frozen wire protocol. */
enum project_command {
    PROJECT_CMD_BYPASS       = 0x01U,
    PROJECT_CMD_FILTER       = 0x02U,
    PROJECT_CMD_SET_THRESHOLD = 0x03U,
    PROJECT_CMD_READ_STATUS  = 0x04U,
    PROJECT_CMD_CLEAR_ERROR  = 0x05U
};

/* PROPOSED future status flags; MISO is not physically verified yet. */
enum project_status_flag {
    PROJECT_STATUS_DETECTED   = 1U << 0,
    PROJECT_STATUS_CLIPPING   = 1U << 1,
    PROJECT_STATUS_SAMPLE_DROP = 1U << 2,
    PROJECT_STATUS_OVERFLOW   = 1U << 3,
    PROJECT_STATUS_ERROR      = 1U << 7
};

#endif
