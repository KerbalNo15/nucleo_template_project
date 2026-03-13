**Description**

This repository is a template project for the Nucleo-L552ZE-Q, including the CMSIS dependencies necessary for a full linux toolchain. The sample project should work as-is without any code changes.

**Usage**

After writing your code, run "make" to build the project, then "make flash" to write it to your board.

VSCode actions are included for GUI interaction under Visual Studio Code's "Run and Debug" tab, one for flashing the program and one for debugging. The debug action supports breakpoints and viewing registers using marus25's Cortex-Debug extension.

**Installation Requirements**

Dependencies:
- arm-none-eabi-gcc
- arm-none-eabi-gdb (optional, adds debugger support for VScode)
- arm-none-eabi-newlib
- openocd

You will need to find the specific package names for your distro, it's quite easy in most cases.

To install on Arch linux: `pacman -Syu arm-none-eabi-gcc arm-none-eabi-gdb arm-none-eabi-newlib openocd`


This project is designed to work with the Cortex-Debug VSCode extension by marus25: [Link for VSCodium](https://open-vsx.org/vscode/item?itemName=marus25.cortex-debug) [Link for VSCode](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug)

This project includes code from the following repositories:
- https://github.com/modm-io/cmsis-svd-stm32/tree/main
- https://github.com/ARM-software/CMSIS_5
- https://github.com/STMicroelectronics/cmsis-device-l5

Special thanks to:
- https://kleinembedded.com/stm32-without-cubeide-part-1-the-bare-necessities/
- https://higaski.at/vscode-arm-cortex-m-debugging/
