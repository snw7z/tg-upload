#!/bin/bash
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${LIGHT_GREEN}Checking for required Python dependencies...${NC}"
pip3 install httpx
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}Warning: Failed to install 'httpx'. Please ensure pip3 is installed and try running with 'sudo' if necessary (e.g., 'sudo ./tg-upload-login.sh').${NC}"
fi
echo ""

echo -e "${LIGHT_GREEN}"
echo "================================================================================"
echo "                        TG-UPLOAD INTERACTIVE LOGIN"
echo "================================================================================"
echo ""

echo "Enter Profile Name:"
echo -n -e "${YELLOW}> ${NC}"
read PROFILE_NAME
echo -e "${LIGHT_GREEN}"

echo "Enter API ID:"
echo -n -e "${YELLOW}> ${NC}"
read API_ID
echo -e "${LIGHT_GREEN}"

echo "Enter API Hash:"
echo -n -e "${YELLOW}> ${NC}"
read API_HASH
echo -e "${LIGHT_GREEN}"

echo ""
echo "Enter your phone number in international format (e.g., +55XX9XXXXXXXXX)"
echo -n -e "${YELLOW}> ${NC}"
read PHONE_NUMBER
echo -e "${LIGHT_GREEN}"

echo ""
echo "Executing login command..."
echo ""

python tg-upload.py --profile "$PROFILE_NAME" --api_id "$API_ID" --api_hash "$API_HASH" --phone "$PHONE_NUMBER" --login_only

RESULT_COLOR="${LIGHT_GREEN}"
RESULT_MESSAGE="LOGIN PROCESS COMPLETED."

echo ""
echo -e "${RESULT_COLOR}================================================================================${NC}"
echo -e "${RESULT_COLOR}                         $RESULT_MESSAGE${NC}"
echo -e "${RESULT_COLOR}================================================================================${NC}"
echo ""

read -n 1 -r -p "Press any key to continue..."

echo ""
echo -e "${NC}"
