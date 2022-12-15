echo "Update conda"
conda update -n base -c defaults conda -y

echo "Install openblas-devel"
conda install openblas-devel -c anaconda -y

echo "Install pytorch"
conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.6 -c pytorch -c conda-forge -y

echo "Install torch-scatter"
pip install torch-scatter -f https://data.pyg.org/whl/torch-1.12.1+cu116.html

echo "Install other libs"
pip install ninja==1.10.2.3 pytorch-lightning fire imageio tqdm wandb python-dotenv pyviz3d scipy plyfile scikit-learn trimesh loguru albumentations volumentations antlr4-python3-runtime==4.8 black==21.4b2

echo "Install omegaconf, hydra-core"
pip install omegaconf==2.0.6 hydra-core==1.0.5 --no-deps

echo "Install detectron2"
pip install 'git+https://github.com/facebookresearch/detectron2.git@710e7795d0eeadf9def0e7ef957eea13532e34cf' --no-deps

# echo "Install requirements"
# export CUDA_HOME=/service/software/cuda/cuda-11.3
# pip install -r requirements.txt --no-cache-dir

echo "Install third_party"
export CUDA_HOME=/service/software/cuda/cuda-11.3
cd third_party/pointnet2 && python setup.py install
