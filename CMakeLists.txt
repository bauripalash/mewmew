cmake_minimum_required(VERSION 3.0)
project(mewmew)
find_package(Java COMPONENTS Runtime REQUIRED)
if(NOT ANTLR_EXE)
    set(ANTLR_EXE
        /usr/local/lib/antlr-4.8-complete.jar
        )
endif()

set(grammar-src ${PROJECT_SOURCE_DIR}/mewmew.g4)

set(antlr4-outlib
    ${PROJECT_SOURCE_DIR}/mewlib/mewmewLexer.cpp
    ${PROJECT_SOURCE_DIR}/mewlib/mewmewParser.cpp
    ${PROJECT_SOURCE_DIR}/mewlib/mewmewBaseVisitor.cpp
    ${PROJECT_SOURCE_DIR}/mewlib/mewmewVisitor.cpp
)
add_custom_command(OUTPUT ${antlr4-outlib}
    COMMAND ${Java_JAVA_EXECUTABLE} -jar ${ANTLR_EXE} ${grammar-src} -Dlanguage=Cpp -no-listener -visitor -o mewlib
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    DEPENDS ${grammar-src}
    )

ADD_CUSTOM_TARGET(GenParser ALL
    DEPENDS ${antlr4-outlib}
)
add_executable(mewmew ${antlr4-outlib} ${PROJECT_SOURCE_DIR}/main.cpp)

ADD_DEPENDENCIES(mewmew GenParser)
target_link_libraries(mewmew /usr/local/lib/libantlr4-runtime.a)

