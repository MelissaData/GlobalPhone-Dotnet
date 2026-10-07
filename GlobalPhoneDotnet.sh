#!/bin/bash

# Builds and runs the Melissa Global Phone Cloud API .NET sample.
#
# This script builds GlobalPhoneDotnet with dotnet publish, then runs the resulting
# executable, passing along the license and (if supplied) the phone number.
#
# Overall flow:
#   1. Parse the command-line options below.
#   2. Resolve the license (--license, then a prompt, then the MD_LICENSE environment variable).
#   3. Publish GlobalPhoneDotnet in Release configuration to ./GlobalPhoneDotnet/Build.
#   4. Run the built executable: one-shot mode if the phone number was supplied,
#      otherwise interactive mode (the .NET program prompts for it).
#
# Options (each takes a value):
#   --phone     Phone number to verify.
#   --license   License string. If omitted, the script prompts for it; if the prompt
#               is left blank, it falls back to MD_LICENSE. Running without --license
#               always prompts, even when MD_LICENSE is set.
#
# Paths are relative to the current directory, so run the script from its own folder.
#
# Examples:
#   ./GlobalPhoneDotnet.sh --license "your-license"
#   ./GlobalPhoneDotnet.sh --phone "800-635-4772" --license "your-license"

######################### Constants ##########################

RED='\033[0;31m' #RED
NC='\033[0m' # No Color

######################### Parameters ##########################

phone=""
license=""

# Read each --flag and its value. A flag with no value, or whose value starts
# with "-", is an error. Unrecognized options are ignored.
while [ $# -gt 0 ] ; do
  case $1 in
    --phone) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'phone\'.${NC}\n"  
            exit 1
        fi 

        phone="$2"
        shift
        ;;
    --license) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'license\'.${NC}\n"  
            exit 1
        fi 

        license="$2"
        shift 
        ;;
  esac
  shift
done

# Build paths are relative to the current directory (not the script's location)
CurrentPath="$(pwd)"
ProjectPath="$CurrentPath/GlobalPhoneDotnet"
BuildPath="$ProjectPath/Build"

if [ ! -d "$BuildPath" ];
then
    mkdir "$BuildPath"
fi

########################## Main ############################
printf "\n==================== Melissa Global Phone Cloud API =====================\n"

# Get license (either from parameters or user input)
if [ -z "$license" ];
then
  printf "Please enter your license string: "
  read license
fi

# Check for License from Environment Variables 
if [ -z "$license" ];
then
  license=`echo $MD_LICENSE` 
fi

if [ -z "$license" ];
then
  printf "\nLicense String is invalid!\n"
  exit 1
fi

# Start program
# Build project
printf "\n============================= BUILD PROJECT ============================\n"

dotnet publish -f="net7.0" -c Release -o "$BuildPath" GlobalPhoneDotnet/GlobalPhoneDotnet.csproj

# Run project
# No phone number supplied -> run interactively; otherwise pass it through for one-shot mode.
if [ -z "$phone" ];
then
    dotnet "$BuildPath"/GlobalPhoneDotnet.dll --license "$license"
else
    dotnet "$BuildPath"/GlobalPhoneDotnet.dll --license "$license" --phone "$phone"
fi


