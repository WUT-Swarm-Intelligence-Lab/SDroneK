#!/bin/bash

HEADLESS=false
WORLD="crazysim_default"

CUSTOM_WORLDS_DIR=/custom_worlds
WORLDS_DIR=/simulator/CrazySim/crazyflie-firmware/tools/crazyflie-simulation/simulator_files/gazebo/worlds

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --headless) HEADLESS=true ;;
        --world) WORLD="$2"; shift ;;
    esac
    shift
done

cd /simulator/CrazySim/crazyflie-firmware

if [[ "$WORLD" != "crazysim_default" ]]; then
    echo "Setting custom world: $WORLD";

    if [[ ! -f "$CUSTOM_WORLDS_DIR/$WORLD.sdf" ]]; then
        echo "World $WORLD does not exist"
        exit 1
    fi

    cp $CUSTOM_WORLDS_DIR/$WORLD.sdf $WORLDS_DIR
fi

echo "Starting CrazySim..."

if [ "$HEADLESS" = true ]; then
    echo "Launched in Headless Mode"
    xvfb-run -a bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0 -w ${WORLD}
else
    echo "Launched in GUI Mode"
    bash tools/crazyflie-simulation/simulator_files/gazebo/launch/sitl_singleagent.sh -m crazyflie -x 0 -y 0 -w ${WORLD}
fi