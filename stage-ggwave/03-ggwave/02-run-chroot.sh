cd /home/ovos
git clone https://github.com/ggerganov/ggwave --recursive
cd ggwave && mkdir build && cd build
cmake .. && make

mv build/bin/* /home/ovos/.local/bin/
rm -rf ggwave

pip3 install git+https://github.com/JarbasHiveMind/hivemind-ggwave
