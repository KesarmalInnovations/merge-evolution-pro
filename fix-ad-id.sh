#!/bin/bash
# fix-ad-id.sh - AD_ID permission fix for Play Console
# Isko repo ke root mein rakho

MANIFEST="android/app/src/main/AndroidManifest.xml"

echo "Checking AD_ID..."

if [ ! -f "$MANIFEST" ]; then
  echo "Manifest nahi mila!"
  exit 1
fi

if grep -q "AD_ID" "$MANIFEST"; then
  echo "✅ AD_ID already exists"
else
  echo "❌ AD_ID missing - adding now..."
  sed -i '/<application/ i \    <uses-permission android:name="com.google.android.gms.permission.AD_ID" />' "$MANIFEST"
  echo "✅ AD_ID added!"
fi

grep -n "AD_ID" "$MANIFEST"
