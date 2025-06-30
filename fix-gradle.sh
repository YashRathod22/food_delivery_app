#!/bin/bash

echo "🔧 Fixing AndroidManifest.xml and build.gradle for Gradle 8+ compatibility..."

declare -A namespaces
namespaces["react-native-vector-icons"]="com.oblador.vectoricons"
namespaces["react-native-linear-gradient"]="com.BV.LinearGradient"
namespaces["react-native-get-random-values"]="org.linusu"
namespaces["react-native-safe-area-context"]="com.th3rdwave.safeareacontext"

for lib in "${!namespaces[@]}"; do
  manifest="node_modules/$lib/android/src/main/AndroidManifest.xml"
  build_gradle="node_modules/$lib/android/build.gradle"
  ns="${namespaces[$lib]}"

  if [ -f "$manifest" ]; then
    echo "🧼 Cleaning manifest: $manifest"
    sed -i '' 's/package="[^"]*"//g' "$manifest"
  fi

  if [ -f "$build_gradle" ]; then
    if ! grep -q "namespace" "$build_gradle"; then
      echo "🛠 Adding namespace to: $build_gradle"
      sed -i '' "/android {/a\\
      \    namespace \"$ns\"
      " "$build_gradle"
    fi
  fi
done

echo "✅ Fix complete. You can now rebuild the project."
