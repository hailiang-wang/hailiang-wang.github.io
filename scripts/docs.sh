#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y-%m-%d %H:%M:%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..

if [ -f index.html ]; then
    rm -rf index.html
fi

pandoc --template ./assets/github.html5 \
        --metadata pagetitle="Hai Liang W's Sharings on GitHub" \
        --metadata date-meta="$DATE_WITH_TIME" \
        -i README.md -o index.html