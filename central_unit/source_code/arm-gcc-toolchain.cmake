# arm-gcc-toolchain.cmake

# 1️⃣ Tell CMake this is a cross-compilation setup
set(CMAKE_SYSTEM_NAME Generic)       # Not Windows/Linux — it’s a bare-metal system
set(CMAKE_SYSTEM_PROCESSOR arm)      # Target architecture

# 2️⃣ Specify compilers
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)

# 3️⃣ Optional: point to a specific installation path
# set(TOOLCHAIN_PATH "C:/Program Files (x86)/Arm GNU Toolchain/13.2 Rel1/bin")
# set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/arm-none-eabi-gcc.exe")
# set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/arm-none-eabi-g++.exe")

# 4️⃣ Avoid linking against host libraries
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# 5️⃣ Add compiler flags (tune for your MCU)
# Example for ARM Cortex-M4 (e.g., STM32F4, nRF52)
set(CMAKE_C_FLAGS "-mcpu=cortex-m4 -mthumb -O2 -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-rtti")
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections")

# 6️⃣ Specify a linker script (you provide this)
# This controls how memory is mapped for your MCU
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/linker_script.ld")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T${LINKER_SCRIPT}")