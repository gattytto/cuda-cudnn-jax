FROM docker.io/nvidia/cuda:12.4.0-runtime-ubuntu22.04 as base
RUN apt update && apt install -y \
                  curl wget git \
                  python3-pip \
                  python3-venv \
                  python3 && \
    pip install --force-reinstall --upgrade pip --ignore-installed && \
    curl -sSL https://install.python-poetry.org | python3 -
    
    
