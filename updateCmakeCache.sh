#!/bin/sh

buildType=''
generator=''
while getopts t:g: flag
do
    case "${flag}" in
        t) buildType=${OPTARG};;
        g) generator=${OPTARG};;
    esac
done

if [ -z $buildType ]; then
    buildType='Release';
elif [[ ( $buildType != 'Release' ) && ( $buildType != 'Debug' ) ]]; then
    buildType='Release';
fi

if [ -z $generator ]; then
    generator='Unix Makefiles';
elif [[ ( $generator != 'Ninja' )  \
       && ( $generator != 'Nmake' ) \
       && ( $generator != 'Unix Makefiles' ) ]]; then
    generator='Unix Makefiles';
fi

echo "Build Type: $buildType";
echo "Generator: $generator";
echo "---\n*** Gerenarate compile database ***"
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S src -B cmake-cache
mv cmake-cache/compile_commands.json compile_database.json
echo "*** Gerenarate compile database done ***"

echo "---\n*** Generate cmake cache ***"
cmake -S src -B build/$buildType -G "$generator" -D CMAKE_BUILD_TYPE=$buildType
echo "---\n*** Generate cmake cache done ***"
