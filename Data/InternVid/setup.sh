#!/bin/bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Load .env file
if [ ! -f .env ]; then
    source .env
fi

git lfs install
git clone https://"$HF_USERNAME":"$HF_TOKEN"@huggingface.co/OpenGVLab/ViCLIP .temp

mkdir models
mv .temp/ViClip-InternVid-10M-FLT.pth models/ViCLIP-L_InternVid-FLT-10M.pth
rm -rf .temp
