#!/bin/bash

HEADLESS=false
CUSTOM_WORLD=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --headless) HEADLESS=true ;;
        --world) CUSTOM_WORLD="$2"; shift ;;
    esac
    shift
done

cd /simulator/CrazySim/crazyflie-firmware

if [ -n "$CUSTOM_WORLD" ] && [ -f "$CUSTOM_WORLD" ]; then
    echo "Setting custom world: $CUSTOM_WORLD"
    cp "$CUSTOM_WORLD" tools/crazyflie-simulation/simulator_files/gazebo/worlds/crazysim_default.sdf
fi

echo "Starting CrazySim..."

if [ "$HEADLESS" = true ]; then
    echo "Launched in Headless Mode"
    xvfb-run -a bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0
else
    echo "Launched in GUI Mode"
    bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0
fi