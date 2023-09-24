# update onnxruntime to working version
pip3 install -U -f onnxruntime~=1.15.0

chown -Rf ovos:ovos /home/ovos

systemctl set-default multi-user.target

systemctl preset-all

su -c "systemctl --user preset-all" --login ovos

su -c "ln -s /ramdisk/mycroft/HiveMind-voice-sat.log /home/ovos/.local/state/mycroft/" --login ovos
