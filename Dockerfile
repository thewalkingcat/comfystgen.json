# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown-registry custom nodes: none of the unknown_registry entries provided an aux_id (GitHub repo) or registry ID.
# Skipping installation of the following unresolved node types (from the workflow): Note, PrimitiveNode, MarkdownNote

# download models into comfyui
RUN comfy model download --url "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors?download=true" --relative-path models/checkpoints --filename sd_xl_refiner_1.0.safetensors
RUN comfy model download --url "https://civitai.com/api/download/models/2358314?type=Model&format=SafeTensor&size=pruned&fp=fp16" --relative-path models/checkpoints --filename JANKUTrainedNoobaiRouwei_v60.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
