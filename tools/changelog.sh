#!/bin/sh

. $ANDROID_BUILD_TOP/vendor/screwd/tools/colors

CURRENT_DATE=`date +%Y%m%d`
PREVIOUS_DATE=`date +%s -d "1 day ago"`
LAST_DATE=`sed -n -e'/ro.build.date.utc/s/^.*=//p' $ANDROID_BUILD_TOP/last_build.prop`

if [ -z "$LAST_DATE" ]; then
    WORKING_DATE=${PREVIOUS_DATE}
else
    WORKING_DATE=${LAST_DATE}
fi

CHANGELOG=$OUT/system/etc/changelog.txt

# Remove existing changelog
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

cp $CHANGELOG $ANDROID_BUILD_TOP/Changelog_${CURRENT_DATE}.txt

exit 0
