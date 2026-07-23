#!/bin/bash
SDK=$(xcrun --sdk iphoneos --show-sdk-path)
clang -shared -o libcheat.dylib cheat.mm \
  -isysroot "$SDK" \
  -framework UIKit \
  -framework Foundation \
  -framework QuartzCore \
  -framework OpenGLES \
  -ObjC -lc++ -arch arm64 \
  -miphoneos-version-min=14.0 \
  -I"$SDK/usr/include/libxml2"
