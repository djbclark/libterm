SET(CMAKE_SYSTEM_NAME qnx)
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
SET(CMAKE_C_COMPILER   $ENV{QNX_HOST}/usr/bin/qcc)
SET(CMAKE_CXX_COMPILER $ENV{QNX_HOST}/usr/bin/qcc)


# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH $ENV{QNX_HOST} $ENV{QTDIR} $ENV{QNX_TARGET} $ENV{QNX_TARGET}/armle-v7)

SET(CMAKE_STATIC_LIBRARY_PREFIX "")
SET(CMAKE_SHARED_LIBRARY_PREFIX "lib")
SET(CMAKE_STATIC_LIBRARY_SUFFIX ".a")
SET(CMAKE_SHARED_LIBRARY_SUFFIX ".so")
SET(CMAKE_FIND_LIBRARY_PREFIXES "lib")
SET(CMAKE_FIND_LIBRARY_SUFFIXES ".so" ".a")

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)

SET(CMAKE_C_FLAGS "-Vgcc_ntoarmv7 -EL ${CMAKE_C_FLAGS}" CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-Vgcc_ntoarmv7 -EL -lang-c++ ${CMAKE_CXX_FLAGS}" CACHE STRING "" FORCE)

SET(QT_USE_QTOPENGL TRUE)
