#!/bin/bash

HELLO='Здравствуйте, уважаемые программисты. В этом скринкасте речь пойдет'
GOODBYE='Спасибо за внимание. До новых встреч на js-seminars.ru!'

function message {
    dialog --msgbox "$1" 12 50
    clear
}

function js_screens {
    for l in `ls -1 *.js`
    do 
        message "`cat $l | egrep '^(\/\*|\ \*)' | sed 's/\/\*//;s/\*\///;s/^\ \*//' | tr '\n' ' ' | sed 's/^ \+//;s/ \+/ /g;s/ \+$//'`"
        vim $l
    done
}

