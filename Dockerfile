FROM docker.io/nvidia/cuda:13.0.0-runtime-ubuntu24.04 as base

RUN apt update && \
    apt install -y \
        golang \
        unzip \
        wget \
        curl \
        git \
        cmake \
        python3-pip \
        python3-venv \
        python3 \
        openjdk-21-jre && \
    curl -fsSL https://ollama.com/install.sh | OLLAMA_VERSION=0.20.0 sh && \
    pip install --force-reinstall --upgrade pip --ignore-installed && \
    curl -sSL https://install.python-poetry.org | python3 -
ENV OLLAMA_MODELS=/storage
    
    
