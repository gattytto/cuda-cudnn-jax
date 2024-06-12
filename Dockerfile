FROM docker.io/nvidia/cuda:12.3.2-runtime-ubuntu22.04 as base
RUN apt update && apt install -y \
                  curl wget git \
                  python3-pip \
                  python3.10 && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    export PATH="/root/.local/bin:$PATH" && \
    pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html && \
    pip install ml-dtypes==0.4.0 && \
    pip install tensorflow-hub && \
    pip install tensorflow==2.16.1 && \
    pip install tensorflow-cpu==2.16.1 && \
    pip install keras-nlp && \
    pip install keras>=3
    
