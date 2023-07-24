# rust stuff
wget https://static.rust-lang.org/rustup/dist/armv7-unknown-linux-gnueabihf/rustup-init
chmod +x rustup-init
./rustup-init -y
rm rustup-init

pip3 install -U pip

pip3 install git+https://github.com/pyca/cryptography

pip3 install git+https://github.com/JarbasHiveMind/HiveMind-voice-sat
pip3 install git+https://github.com/JarbasHiveMind/hivemind_websocket_client
pip3 install git+https://github.com/JarbasHiveMind/poorman_handshake

pip3 install git+https://github.com/OpenVoiceOS/ovos-audio@bfc259d48c6d221c110b16d7c1c4f33b7ba7471a
