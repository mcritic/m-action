#!/bin/bash
set -e

name=$1
time=$(date)
echo "Hello, $name! The current time is $time"
echo "::set-output name=time::$time"