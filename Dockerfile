FROM docker.io/nvidia/cuda:12.3.2-cudnn9-runtime-ubuntu22.04 as base
RUN apt update && apt install -y \
                  curl wget git \
                  python3-pip \
                  python3.10 && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    export PATH="/root/.local/bin:$PATH" && \
    git clone https://github.com/google-deepmind/recurrentgemma.git && cd recurrentgemma && poetry install -E jax && pip install .[jax] && cd .. && rm -rf recurrentgemma && \
    pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html && \
    pip install keras-nlp tensorflow-hub tensorflow-cpu keras
    
