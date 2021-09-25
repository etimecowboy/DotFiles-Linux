#!/bin/bash
_fasd_prompt_func () 
{ 
    eval "fasd --proc $(fasd --sanitize $(history 1 |     sed "s/^[ ]*[0-9]*[ ]*//"))" >> "/dev/null" 2>&1
}
