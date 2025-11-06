#!/bin/bash

wget https://raw.githubusercontent.com/STMicroelectronics/cmsis-device-wb/refs/heads/master/Include/system_stm32wbxx.h \
    -r -O ./cmsis/system_stm32wbxx.h

wget https://raw.githubusercontent.com/STMicroelectronics/cmsis-device-wb/refs/heads/master/Include/stm32wb55xx.h \
    -r -O ./cmsis/stm32wb55xx.h

wget https://raw.githubusercontent.com/STMicroelectronics/cmsis-device-wb/refs/heads/master/Include/stm32wbxx.h \
    -r -O ./cmsis/stm32wbxx.h

