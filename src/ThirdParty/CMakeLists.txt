cmake_minimum_required(VERSION 3.24)

############
### Soci ###
############
option(SOCI_EMPTY "Build the sample backend called Empty" ON)
set(Soci_Root_Dir ${CMAKE_CURRENT_SOURCE_DIR}/soci-install)
find_package(Soci REQUIRED
        PATHS ${Soci_Root_Dir}/lib/cmake/SOCI)

find_library(mysqlcl mysqlclient REQUIRED)

list(APPEND Soci_Libs soci_core
        soci_empty
        soci_mysql
        ${mysqlcl})
list(APPEND Soci_Include_Dir /opt/homebrew/Cellar/mysql/8.1.0/include/mysql ${Soci_Root_Dir}/include)
list(APPEND Soci_Libs_Dir ${Soci_Root_Dir}/lib/)

set(Soci_Libs_Dir ${Soci_Libs_Dir} PARENT_SCOPE)
set(Soci_Libs ${Soci_Libs} PARENT_SCOPE)
set(Soci_Include_Dir ${Soci_Include_Dir} PARENT_SCOPE)

##################
### WorLibrary ###
##################
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/WorLibrary)
set(WorLib_Include_Dir ${WorLib_Include_Dir} PARENT_SCOPE)
set(WorLib_Json ${WorLib_Json} PARENT_SCOPE)
set(WorLib_Sql ${WorLib_Sql} PARENT_SCOPE)
set(WorLib_Vector ${WorLib_Vector} PARENT_SCOPE)
set(WorLib_Network ${WorLib_Network} PARENT_SCOPE)

########################
### MediaServerUtils ###
########################
IF (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Utils)
    add_subdirectory(Utils)
    set(Utils_Src ${Utils_Src} PARENT_SCOPE)
    set(Utils_Include_Dir ${Utils_Include_Dir} PARENT_SCOPE)
endif ()
