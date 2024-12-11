FROM docker.io/nvidia/cuda:12.4.0-runtime-ubuntu22.04 as base
RUN apt update && apt install -y \
                  curl wget git \
                  python3-pip \
                  python3-venv \
                  python3 && \
    pip install --force-reinstall --upgrade pip --ignore-installed && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    export PATH="/root/.local/bin:$PATH" && \
    pip install -v --upgrade ml-dtypes==0.4.0 \
                tensorflow-hub \
                "tensorflow[and-cuda]" \
                "jax[cuda12_pip]" \
                keras-nlp \
                keras>=3 \
                jupyterlab>=4 \
                --extra-index-url https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
USER 1000
    
