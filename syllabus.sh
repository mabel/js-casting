#!/bin/bash

read -p 'Online? ' ONLINE

. ../lib/functions.sh

message "$HELLO "

js_screens

message "$SUMMARY "
message "$GOODBYE"

