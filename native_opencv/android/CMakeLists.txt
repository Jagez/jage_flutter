cmake_minimum_required(VERSION 3.4.1)
include_directories(${CMAKE_SOURCE_DIR}/src/main/cpp/include)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/main/nativeLibs/${ANDROID_ABI}) 
add_library(lib_opencv
        SHARED 
        IMPORTED )

set_target_properties(lib_opencv PROPERTIES
        IMPORTED_LOCATION 
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/nativeLibs/${ANDROID_ABI}/libopencv_java4.so)

add_library(
    native-lib
    SHARED
    src/main/cpp/native-lib.cpp
)
target_link_libraries(
    native-lib
    lib_opencv
    log
    android )