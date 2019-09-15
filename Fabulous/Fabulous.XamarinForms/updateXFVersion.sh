#!/bin/bash

TEMPLATE_FILE="Fabulous.XamarinForms/templates/content/blank/.template.config/template.json"
PACKAGE_TARGETS="Packages.targets"
PAKET_DEPENDENCIES="paket.dependencies"
PAKET_LOCK="paket.lock"

FILES_TO_CHANGE=( $TEMPLATE_FILE $PACKAGE_TARGETS $PAKET_DEPENDENCIES $PAKET_LOCK )
        
if [ $# -ne 2 ]
then
        echo "please input a versionnumber"
        exit 1
fi

OLD_XF_VERSION=$1
NEW_XF_VERSION=$2

for versionFile in ${FILES_TO_CHANGE[@]}
do
        sed -i '' "s/$OLD_XF_VERSION/$NEW_XF_VERSION/g" $versionFile
        echo "File changed: $versionFile"
done

echo "Successfully change to version $NEW_XF_VERSION"
exit 0
