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
        --metadata pagetitle="Thoughts and Learnings from Hai Liang W. for Everyone" \
        --metadata description="心理学, 哲学, 科技, 财务, 沟通, 写作, 思考" \
        --metadata keywords="心理学, 哲学, 科技, 财务, 沟通, 写作, 思考" \
        --metadata date-meta="$DATE_WITH_TIME" \
        -i INDEX.md -o index.html