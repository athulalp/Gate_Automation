cmake_minimum_required(VERSION 3.16)
project(HelloARM C CXX ASM)

add_executable(${PROJECT_NAME}
    central_unit/source/main.c
)

# Optional: print size after build
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} ${PROJECT_NAME}
)