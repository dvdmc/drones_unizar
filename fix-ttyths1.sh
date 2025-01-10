#!/bin/bash
if [ -e /dev/ttyTHS1 ]; then
  udevadm control --reload-rules
  udevadm trigger /dev/ttyTHS1
fi