# Firefox Update Control

Three ways to control Firefox updates (installed + portable).

## 1. Batch Scripts (Registry)

Auto-modify registry via `.bat` files:

- `disable_firefox_update.bat` – disables updates (`DisableAppUpdate = 1`)
- `enable_firefox_update.bat` – enables updates (`DisableAppUpdate = 0`)

**Path:** `HKLM\Software\Policies\Mozilla\Firefox\DisableAppUpdate` [web:1]

## 2. REG Files (Registry Import)

Double-click ready `.reg` files:

- `disable_firefox_updates.reg` – disables updates
- `enable_firefox_updates.reg` – enables updates

**Same registry path:** `HKLM\Software\Policies\Mozilla\Firefox\DisableAppUpdate` [web:1]

## 3. policies.json (No Registry)

Place in Firefox `distribution` folder:

**Installed Firefox:**
`C:\Program Files\Mozilla Firefox\distribution\policies.json`

**Portable Firefox:**
`FirefoxPortable\App\Firefox64\distribution\policies.json`


**Content:**
`{"policies":{"DisableAppUpdate":true}}`
