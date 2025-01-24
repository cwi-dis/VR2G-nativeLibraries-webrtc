# VR2G-nativeLibraries-webrtc

Repository with VR2Gather submodule that stores native binary DLLs and helper programs for using WebRTC transport.

The package itself is in the subdirectory `nl.cwi.dis.vr2gather.nativelibraries.webrtc`.

Add to Unity by using Package Manager -> Add Git URL and then using URL `git+https://github.com/cwi-dis/VR2G-nativeLibraries-webrtc?path=/nl.cwi.dis.vr2gather.nativelibraries.webrtc`.

## How it works

These are the C# "pinvoke" wrappers around the <https://github.com/jvdrhoof/WebRTConnector> DLL that communicates to the WebRTC "peer" helper from <https://github.com/jvdrhoof/WebRTCSFU> which is started locally on demand.

These will communicate with the WebRTC SFU, also from <<https://github.com/jvdrhoof/WebRTCSFU>, which will be started on demand by the <https://github.com/cwi-dis/vr2gather-orchestrator-v2>.

All of these together enable using WebRTC transport for point cloud and voice communication in VR2Gather.

## Maintainance


Whenever there is a new release _vX.Y.Z_ done on the _WebRTCSFU_ or _WebRTCConnector_ github page, install the executables here by running

```
./scripts/get_peer.sh vX.Y.Z
./scripts/get_connector.sh vX.Y.Z
```

Then update the `package.json` and `CHANGELOG.md`.

After that it may be a good idea to open the `Importer` Unity project once, in the Unity Editor. This will fix any `.meta` file issues.

Then `git add`, `git commit`, `git tag` and `git push`.
