docker build -t pytorch-geometric-env .
docker run --gpus all pytorch-geometric-env:latest
docker save -o pytorch-geometric-env.tar pytorch-geometric-env:latest

# docker load -i pytorch-geometric-env.tar
docker run --gpus all -it pytorch-geometric-env:latest
# docker run --gpus all -it pytorch-geometric-env:latest bash


docker scan pytorch-geometric-env --dependency-tree --json -f Dockerfile --group-issues

chmod 777 /mnt/c/Users/your_username/shared_folder
# docker run --gpus all -it -v /mnt/c/Users/your_username/shared_folder:/workspace/shared_folder pytorch-geometric-env:latest bash
