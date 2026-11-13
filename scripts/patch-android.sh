#!/usr/bin/env bash
# 讓手機能直接覆蓋更新：versionCode 逐次增加，並在有提供金鑰時用固定金鑰簽章。
# 金鑰與密碼從 GitHub Secrets 傳入（環境變數），不放在 repo 內。
set -euo pipefail
VERSION_CODE="${1:?需要 versionCode}"
GRADLE=android/app/build.gradle
sed -i "s/versionCode 1\$/versionCode ${VERSION_CODE}/" "$GRADLE"
sed -i "s/versionName \"1.0\"/versionName \"1.0.${VERSION_CODE}\"/" "$GRADLE"
grep -q "versionCode ${VERSION_CODE}" "$GRADLE"
if [ -z "${KEYSTORE_B64:-}" ] || [ -z "${KEYSTORE_PASSWORD:-}" ]; then
  echo "::warning::沒有設定 ANDROID_KEYSTORE_BASE64 與 ANDROID_KEYSTORE_PASSWORD，這次的 APK 每次簽章都不同，無法覆蓋更新。"
  exit 0
fi
echo "$KEYSTORE_B64" | base64 -d > android/app/heluo.keystore
sed -i '0,/^android {/s//android {\n    signingConfigs {\n        debug {\n            storeFile file("heluo.keystore")\n            storePassword System.getenv("KEYSTORE_PASSWORD")\n            keyAlias "heluo"\n            keyPassword System.getenv("KEYSTORE_PASSWORD")\n        }\n    }/' "$GRADLE"
grep -q "heluo.keystore" "$GRADLE"
