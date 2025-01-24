#!/bin/bash
# Usage
case x$1 in
x)
	echo Usage: $0 release
	echo Will download binaries from https://github.com/jvdrhoof/WebRTCSFU/releases/download/release
	echo and install them in the correct place here
	exit 1
	;;
x*)
	release=$1
	;;
esac
if [ -d nl.cwi.dis.vr2gather.nativelibraries.webrtc/Runtime/Plugins ] ; then
	echo "Please run this script from the root of the project"
	exit 1
fi
set -x
rm -rf tmp
mkdir -p tmp
curl --location --output tmp/webrtcsfu-macos.tgz https://github.com/jvdrhoof/WebRTCSFU/releases/download/${release}/webrtcsfu-x86_64-apple-darwin.tgz
curl --location --output tmp/webrtcsfu-win.tgz https://github.com/jvdrhoof/WebRTCSFU/releases/download/${release}/webrtcsfu-x86_64-unknown-windows.tgz
curl --location --output tmp/webrtcsfu-linux.tgz https://github.com/jvdrhoof/WebRTCSFU/releases/download/${release}/webrtcsfu-x86_64-unknown-linux.tgz
cd tmp
mkdir win macos linux
(cd win ; tar xfv ../webrtcsfu-win.tgz)
(cd macos ; tar xfv ../webrtcsfu-macos.tgz)
(cd linux ; tar xfv ../webrtcsfu-linux.tgz)
case `uname` in
Darwin)
	xattr -d com.apple.quarantine macos/bin/*
	;;
esac
cd ..
cp tmp/win/bin/WebRTCSFU-peer.exe nl.cwi.dis.vr2gather.nativelibraries.webrtc/Runtime/Plugins/win-x64/WebRTCSFU-peer.exe
cp tmp/macos/bin/WebRTCSFU-peer nl.cwi.dis.vr2gather.nativelibraries.webrtc/Runtime/Plugins/mac/WebRTCSFU-peer.exe
cp tmp/linux/bin/WebRTCSFU-peer nl.cwi.dis.vr2gather.nativelibraries.webrtc/Runtime/Plugins/linux-x64/WebRTCSFU-peer.exe
rm -rf tmp
