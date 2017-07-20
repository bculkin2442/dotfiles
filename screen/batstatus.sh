#!/bin/bash

# Get the battery status as a percentage
upower --dump | grep percentage | head -1 | cut -d' ' -f15-
