#!/bin/bash

HEADLESS=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --headless) HEADLESS=true ;;
    esac
    shift
done

cd /simulator/CrazySim/crazyflie-firmware

echo "Starting CrazySim..."

if [ "$HEADLESS" = true ]; then
    echo "Launched in Headless Mode"
    xvfb-run -a bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0
else
    echo "Launched in GUI Mode"
    bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0
fi