@echo off
:: Enable Mozilla Firefox updates via registry
:: Requires administrator privileges

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required. Run as administrator.
    pause
    exit /b 1
)

:: Ensure Mozilla policy key exists (32-bit)
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla" /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to create Mozilla key
    pause
    exit /b 1
)

:: Ensure Firefox subkey exists (32-bit)
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla\Firefox" /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to create Firefox key
    pause
    exit /b 1
)

:: Set DisableAppUpdate DWORD (32-bit) = 0 to enable updates
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d 0 /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to set DisableAppUpdate value
    pause
    exit /b 1
)

echo Settings applied successfully!
echo Firefox updates are now enabled.
echo Restart Firefox to apply changes.
pause
