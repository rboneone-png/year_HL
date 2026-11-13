# 河洛數理投資

以國曆顯示年、月、週投資氣象的網頁 App（`www/index.html`），用 Capacitor 打包成 Android APK。

## 取得 APK（不需安裝編譯軟體）
1. 推送到 GitHub，Actions 的 **Build APK** 會自動執行（也可在 Actions 頁手動 Run workflow）。
2. 完成後在該次執行頁面下方 Artifacts 下載 `hl-invest-apk`，解壓得到 `app-debug.apk`。
3. 傳到手機安裝（需允許「安裝未知來源 App」）。

此為 debug 簽章 APK，供自用；上架 Google Play 需另做 release 簽章。

## GitHub Pages
合併到預設分支（main）後，`Deploy Pages` 會把 `www/` 發佈成網站：
`https://rboneone-png.github.io/year_HL/`
若首次沒有自動啟用，到 Settings → Pages → Source 選 **GitHub Actions**。

## 直接下載 APK
合併到 main 後，最新 APK 會放在 Releases：
https://github.com/rboneone-png/year_HL/releases/download/latest/heluo-invest.apk

## 覆蓋更新
手機要能直接覆蓋安裝新版，每次建置必須用同一把簽章金鑰，且 versionCode 要遞增。
- versionCode 由 GitHub 建置序號自動遞增。
- 簽章金鑰放在 GitHub Secrets（不放在 repo）：`ANDROID_KEYSTORE_BASE64`（金鑰檔的 base64）與 `ANDROID_KEYSTORE_PASSWORD`。金鑰別名固定為 `heluo`。
- 沒設定 Secrets 時仍會建置，但每次簽章不同，手機要先解除安裝舊版才能裝新版。
