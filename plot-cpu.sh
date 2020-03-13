#!/usr/bin/env sh
# -*- coding: UTF8 -*-

# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr
# https://research.pasteur.fr/en/member/guillaume-bouvier/
# 2020-03-13 15:00:07 (UTC+0100)

# --------------------- Plot the CPU usage for a given PID ---------------------
if [ "$#" -ne 1 ]; then
    echo "Plot the CPU usage for a given PID"
    echo "Usage: plot-cpu PID"
    exit
fi

top -d 1 -b -p "$1" | grep --line-buffered Cpu | awk '{print $2; system("")}' | plot --interactive --xlabel='Time (s)' --ylabel 'CPU usage (%)'
