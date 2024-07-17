# Use a base image that supports CUDA 12.1
FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.12 \
    python3.12-distutils \
    python3.12-venv \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install pip for Python 3.12
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

# Set python3.12 and pip3.12 as the default python3 and pip
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.12 1

# Install PyTorch 2.3 with CUDA 12.1 support
RUN pip install torch==2.3.0+cu121 torchaudio==2.3.0+cu121 --extra-index-url https://download.pytorch.org/whl/cu121

# Install torch_geometric and its dependencies
RUN pip install torch_geometric
# Optional dependencies:
RUN pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.3.0+cu121.html

# Set the working directory
WORKDIR /workspace

# Add your script to the Docker image
COPY test_install.py /workspace/

CMD ["python3", "test_install.py"]
