FROM docker.io/nvidia/cuda:12.4.0-runtime-ubuntu22.04 as base
RUN apt update && \
    apt install -y \
        unzip \
        wget \
        curl \
        git \
        cmake \
        python3-pip \
        python3-venv \
        python3 && \
    wget -q https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin && \
    mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    wget https://developer.download.nvidia.com/compute/cuda/12.8.0/local_installers/cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu2204-12-8-local_12.8.0-570.86.10-1_amd64.deb && \
    cp /var/cuda-repo-ubuntu2204-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/ && \
    apt update && apt install -y \
                  cuda-toolkit-12-8 && \
    curl -fsSL https://ollama.com/install.sh | sh && \
    pip install --force-reinstall --upgrade pip --ignore-installed && \
    curl -sSL https://install.python-poetry.org | python3 -
ENV OLLAMA_MODELS=/storage
    
    
