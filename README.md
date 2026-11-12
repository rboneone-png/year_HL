# 河洛數理投資

以國曆顯示年、月、週投資氣象的網頁 App（`www/index.html`），用 Capacitor 打包成 Android APK。

## 取得 APK（不需安裝編譯軟體）
1. 推送到 GitHub，Actions 的 **Build APK** 會自動執行（也可在 Actions 頁手動 Run workflow）。
2. 完成後在該次執行頁面下方 Artifacts 下載 `hl-invest-apk`，解壓得到 `app-debug.apk`。
3. 傳到手機安裝（需允許「安裝未知來源 App」）。

此為 debug 簽章 APK，供自用；上架 Google Play 需另做 release 簽章。
