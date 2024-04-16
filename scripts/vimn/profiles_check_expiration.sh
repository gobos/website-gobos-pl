#!/bin/bash 

WORK_DIR=~/Library/MobileDevice/Provisioning\ Profiles/
DATE_CURRENT=$(date +'%Y%m%d')
EXPIRED_PROFILES_DIR=~/expired_profiles_dir

for file in `ls -1 "$WORK_DIR"`; do
    profile="$WORK_DIR$file" 
    profile_expire_date=$(security cms -D -i "$profile" |grep -A1 Expiration|tail -n1 |cut -f2 -d '>'|cut -f1 -d'<'|cut -c 1-10 |tr -d '-')
#    echo "$DATE_CURRENT"  "$profile_expire_date" 
    if [ "$DATE_CURRENT" -gt "$profile_expire_date" ]; then
        echo "expired profile: $profile : $profile_expire_date ... moving"
        if [ ! -d $EXPIRED_PROFILES_DIR ]; then 
            mkdir $EXPIRED_PROFILES_DIR 
        fi
        mv "$profile" "$EXPIRED_PROFILES_DIR/"
    fi

done
