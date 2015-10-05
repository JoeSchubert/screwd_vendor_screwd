#!/bin/sh

. $ANDROID_BUILD_TOP/vendor/slim/tools/colors

CURRENT_DATE=`date +%Y%m%d`
PREVIOUS_DATE=`date +%s -d "1 day ago"`

# Get last build prop
LAST_PROP=last_build-$TARGET_DEVICE.prop
if [ ! -f "$LAST_PROP" ]; then
    LAST_PROP=last_build.prop
    if [ ! -f "$LAST_PROP" ]; then
        echo ${CL_RED}"Cannot generate changelog"${CL_RST}
        echo ${CL_RED}"Extract build.prop from previous released build and rename it to last_build-{DeviceName}.prop"${CL_RST}
        exit 0
    fi
fi

# Get last build date
LAST_DATE=`sed -n -e'/ro.build.date.utc/s/^.*=//p' $ANDROID_BUILD_TOP/$LAST_PROP`
if [ -z "$LAST_DATE" ]; then
    WORKING_DATE=${PREVIOUS_DATE}
else
    WORKING_DATE=${LAST_DATE}
fi

# Remove existing changelog
CHANGELOG=$OUT/system/etc/changelog.txt
file="$CHANGELOG"
if [ -f "$file" ]; then
    echo ${CL_CYN}"Removing existing ${CHANGELOG}"${CL_RST}
    rm $CHANGELOG;
fi

# Find the directories to log
find $ANDROID_BUILD_TOP -name .git | sed 's/\/.git//g' | sed 'N;$!P;$!D;$d' | while read line
do
    cd $line
    log=$(git log --pretty="%an - %s" --no-merges --since=$WORKING_DATE --date-order)
    project=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')
    if [ ! -z "$log" ]; then
        # Write the changelog
        echo "Project name: $project" >> $CHANGELOG
        echo "$log" | while read line
        do
             echo "  *$line" >> $CHANGELOG
        done
        echo "" >> $CHANGELOG
    fi
done

# Copy changelog file to the root folder
cp $CHANGELOG $ANDROID_BUILD_TOP/Changelog_${CURRENT_DATE}.txt

exit 0
