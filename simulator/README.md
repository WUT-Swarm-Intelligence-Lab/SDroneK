# Simulator Setup

This uses the [CrazySim](https://github.com/gtfactslab/CrazySim) simulator with [Gazebo](https://gazebosim.org/home) as a backend. [The `start.sh` script](./start.sh) uses the CrazySim instructions to set up the container. 

## Prerequisites

This guide assumes you are using [Docker Engine](https://docs.docker.com/engine/) instead of Docker Desktop. Using Docker Desktop may cause problems.

It also assumes you are entering all commands from the root of the repository.

Before continuing ensure the docker deamon is running:

```bash
systemctl status docker
```

## Launching in GUI Mode

GUI Mode launches the simulator in a window on your own PC. In order to launch the simulator in this mode, your window system must allow docker:

```bash
xhost +local:docker
```

Then you can run:

```bash
sudo docker compose up --build
```

A window with the `Gazebo` simulator should appear on your screen.

## Launching in Headless Mode

Headless Mode launches the simulator in the background. It's meant to be used in automated testing. In order to launch the simulator in headless mode you must provide the `--headless` argument as below:

```bash
docker compose run --rm crazysim /simulator/start.sh --headless
```

## Using custom worlds

The simulator allows you to provide custom worlds. In order to use them, you must place your world files inside `SDroneK/simulator/custom_worlds/`. These must not be in any subdirectories.

Then you can use the `--world` argument as below:

```bash
docker compose run --rm crazysim /simulator/start.sh --world your_world
```

Notice that the world is not a path but a name. Due to how `CrazySim` handles passing worlds this must be only the name part of the filename, without the extension (`your_world.sdf` will not work). It also cannot contain any subdirectories (you cannot pass `subdir/your_world`).