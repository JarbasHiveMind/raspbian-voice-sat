cd /home/ovos
git clone https://github.com/ggerganov/ggwave --recursive
su -c "cd ggwave && mkdir build && cd build" --login ovos
su -c "cmake .. && make" --login ovos

mv build/bin/* /home/ovos/.local/bin/
rm -rf ggwave

pip3 install git+https://github.com/JarbasHiveMind/hivemind-ggwave
