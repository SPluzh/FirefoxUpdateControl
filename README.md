# Firefox Update Control

Manage Firefox updates (installed + portable).

## Files

| Type     | Disable                    | Enable                     |
|----------|----------------------------|----------------------------|
| **Batch** | `disable_firefox_update.bat` | `enable_firefox_update.bat` |
| **Registry** | `disable_firefox_updates.reg` | `enable_firefox_updates.reg` |
| **JSON**  | `policies.json`            | -                          |

## Usage

**Installed Firefox:**
Registry/Batch: HKLM\Software\Policies\Mozilla\Firefox\DisableAppUpdate
JSON: C:\Program Files\Mozilla Firefox\distribution\policies.json


**Portable Firefox:**
JSON: FirefoxPortable\App\Firefox64\distribution\policies.json

**policies.json:**
{"policies":{"DisableAppUpdate":true}}


## Verify
Settings → General → "Updates disabled by your administrator" [web:1]

## Revert
reg delete "HKLM\Software\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /f /reg:32
rmdir /s "*/distribution"
