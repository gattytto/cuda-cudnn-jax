FROM docker.io/nvidia/cuda:12.5.1-runtime-ubuntu24.04 as base
RUN apt update && apt install -y \
                  curl wget git \
                  python3-pip \
                  python3 && \
    pip install --upgrade pip && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    export PATH="/root/.local/bin:$PATH" && \
    pip install --break-system-packages --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html && \
    pip install --break-system-packages ml-dtypes==0.4.0 \
                tensorflow-hub \
                tensorflow[and-cuda] \
                keras-nlp \
                keras>=3 && \
    pip list
    
