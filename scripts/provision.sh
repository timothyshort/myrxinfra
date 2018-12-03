#!/bin/bash
echo "******************"
echo "INSTALLING CHROME..."
#yum install -y chromium-chromedriver
#ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver
wget https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
chromedriver --version
curl https://intoli.com/install-google-chrome.sh | bash
mv /usr/bin/google-chrome-stable /usr/bin/google-chrome
google-chrome --version && which google-chrome
echo "FINISHED INSTALLING CHROME"

echo "******************"
echo "INSTALLING Xvfb"
yum install -y xorg-x11-server-Xvfb xorg-x11-fonts
echo "FINISHED INSTALLING Xvfb"

echo "******************"
echo "INSTALLING PYTHON PIP"
yum install -y python-pip
echo "FINISHED INSTALLING PYTHON PIP"

echo "******************"
echo "UPGRADING PYTHON PIP"
pip install --upgrade pip
echo "FINISHED UPGRADING PYTHON PIP"

echo "******************"
echo "INSTALLING CONDA"
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -u -b -p ~/miniconda
rm ~/miniconda.sh
echo "PATH=\$PATH:\$HOME/miniconda/bin" >> .bash_profile
source .bash_profile
echo "FINISHED INSTALLING CONDA"

echo "******************"
echo "CREATING CONDA ENVIRONMENT"
conda env create -f env.yml
source activate PySelPaM
pip install pyvirtualdisplay==0.2
pip install selenium==2.51.1
pip install Pillow
echo "FINISHED PREPARING CONDA ENVIRONMENT"

echo "******************"
echo "RUN TEST SCRIPT"
python test.py
echo "FINISHED RUNNING TEST SCRIPT"
