# arm-gcc-toolchain.cmake
# -------------------------------------------------------------------
# CMake toolchain file for cross-compiling to ARM Cortex-M (bare metal)
# using the GNU Arm Embedded Toolchain (arm-none-eabi-*)
# -------------------------------------------------------------------

# Tell CMake we're cross-compiling
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Path to the ARM GCC toolchain
# Adjust this path according to your system
# set(ARM_TOOLCHAIN_PATH "/usr/bin")
# set(ARM_TOOLCHAIN_PATH "C:/Program Files (x86)/GNU Arm Embedded Toolchain/10 2021.10/bin")

# Ensure the environment variable is set
if(NOT DEFINED ENV{ARM_TOOLCHAIN_PATH})
    message(FATAL_ERROR "Please set ARM_TOOLCHAIN_PATH to your ARM GCC bin folder.")
endif()

# Compiler executables
set(CMAKE_C_COMPILER   "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-gcc.exe")
set(CMAKE_CXX_COMPILER "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-g++.exe")
set(CMAKE_ASM_COMPILER "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-gcc.exe")

# Optional: specify the linker
set(CMAKE_LINKER       "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-ld.exe")

# Optional: specify other tools
set(CMAKE_AR           "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-ar.exe")
set(CMAKE_OBJCOPY      "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-objcopy.exe")
set(CMAKE_OBJDUMP      "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-objdump.exe")
set(CMAKE_SIZE         "$ENV{ARM_TOOLCHAIN_PATH}/arm-none-eabi-size.exe")

# -------------------------------------------------------------------
# Target-specific flags
# Adjust these for your MCU core and FPU settings
# -------------------------------------------------------------------
set(MCU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

# Compilation flags
set(CMAKE_C_FLAGS_INIT   "${MCU_FLAGS} -O2 -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS_INIT "${MCU_FLAGS} -O2 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti")
set(CMAKE_ASM_FLAGS_INIT "${MCU_FLAGS}")

# Linker flags (you can adjust linker script path here)
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/linker_script.ld")
set(CMAKE_EXE_LINKER_FLAGS_INIT "${MCU_FLAGS} -Wl,--gc-sections -T${LINKER_SCRIPT}")

# Disable standard system libraries — no OS
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
