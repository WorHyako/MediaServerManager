#!bin/sh

buildType=''
while getopts t: flag
do
    case "${flag}" in
        t) buildType=${OPTARG};;
    esac
done

if [ -z $buildType ]; then
    buildType='Release';
elif [[ ( $buildType != 'Release' ) && ( $buildType != 'Debug' ) ]]; then
    buildType='Release';
fi

echo "Build Type: $buildType";

cmake --build "build/$buildType"
