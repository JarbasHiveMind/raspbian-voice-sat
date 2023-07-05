# raspbian-hive-voice-satellite

<strong>** DEV BRANCH **</strong>

<strong>Images built from this branch are NOT guaranteed to always work.</strong>

Simple voice satellite for a [HiveMindServer](https://github.com/JarbasHiveMind/HiveMind-core)

Pre-built images can be found on the on the [HiveMind Download Page](https://ovosimages.ziggyai.online/raspbian/hivemind/).

Check out the [community documentation](https://jarbashivemind.github.io/HiveMind-community-docs/) for information.

## Using this image

Before your device will connect with HiveMind, you must create some credentials

- From your HiveMind server
  - Create a new device
    - `hivemind-core add-device <your device name>`
    - copy the `key` and `password` values you will need them

- From your device
  - edit the system hook file
  - `sudo nano /usr/libexec/hive_systemd_voice_sat`
  - Edit the values contained in all of the `<CHANGE THIS>` areas
  - Restart the hive-voice-sat.service
    - `systemctl --user restart hive-voice-sat.service`

You should now be able to use your satellite
