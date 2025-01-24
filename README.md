# VR2G-nativeLibraries-webrtc

Repository with VR2Gather submodule that stores native binary DLLs and helper programs
for using WebRTC transport.

The package itself is in the subdirectory `nl.cwi.dis.vr2gather.nativelibraries.webrtc`.

Add to Unity by using Package Manager -> Add Git URL and then using URL `git+https://github.com/cwi-dis/VR2G-nativeLibraries-webrtc?path=/nl.cwi.dis.vr2gather.nativelibraries.webrtc`.

## Maintainance

> These instructions are wrong. New ones to be supplied later.


Once a new release of lldash is available do the following steps:

- Download the lldash tarball for each platform,
- Run `scripts/ingest.sh` with the 3 platform top-level directories
	- This will delete all the old dynamic libraries inside the package, and copy the new ones in. `.meta` files will be left in place.
- Open the `Ingest` project in Unity.
	- This will create any missing `.meta` files, and delete any spurious ones.
- Change version number and changelog.
- `git` add, commit, push.

