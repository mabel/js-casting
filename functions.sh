#!/bin/bash

TOKEN=`cat ../lib/token.slack`
HELLO='Здравствуйте, уважаемые программисты. В этом скринкасте речь пойдет'
GOODBYE='Спасибо за внимание. До новых встреч на js-invite.ru!'
SUMMARY='Подведем итоги.'

function message {
    dialog --msgbox "$1" 12 50
    clear
}

function js_screens {
    for l in `ls -1 *.js`
    do 
        message "`cat $l | egrep '^(\/\*|\ \*)' | sed 's/\/\*//;s/\*\///;s/^\ \*//' | tr '\n' ' ' | sed 's/^ \+//;s/ \+/ /g;s/ \+$//'`"
        vim $l
        if [ -n "$ONLINE" ]; then
            curl -F "file=@$l" -F "channels=#auditorium" -F "token=$TOKEN" https://slack.com/api/files.upload
        fi
    done
}

