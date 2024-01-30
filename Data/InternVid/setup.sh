#!/bin/bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

source .env

apt-get update
# Maybe use opencv-python-headless instead to avoid GUI dependencies
apt-get install git-lfs ffmpeg libsm6 libxext6 -y
git lfs install
git clone https://"$HF_USERNAME":"$HF_TOKEN"@huggingface.co/OpenGVLab/ViCLIP .temp

mkdir -p models
mv .temp/ViClip-InternVid-10M-FLT.pth models/ViCLIP-L_InternVid-FLT-10M.pth
rm -rf .temp
