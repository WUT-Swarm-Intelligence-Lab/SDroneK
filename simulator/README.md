# Simulator Setup

This guide assumes you are using [Docker Engine](https://docs.docker.com/engine/) instead of Docker Desktop. Using Docker Desktop may cause problems.

It also assumes you are entering all commands from the root of the repository.

Before continuing ensure the docker deamon is running:

```bash
systemctl status docker
```

## Launching in GUI Mode

In order to launch your window system must allow docker:

```bash
xhost +local:docker
```

Then you can run:

```bash
sudo docker compose up --build
```

A window with the `Gazebo` simulator should appear on your screen.

## Launching in Headless Mode

In order to launch the simulator in headless mode you must provide the `--headless` argument as below:

```bash
docker compose run --rm crazysim /simulator/start.sh --headless
```

## Using custom worlds

The simulator allows you to provide custom worlds. In order to use them, you must place your world files inside `SDroneK/simulator/custom_worlds/`. Then you can use the `--world` argument as below:

```bash
docker compose run --rm crazysim /simulator/start.sh --world /custom_worlds/your_world.sdf
```