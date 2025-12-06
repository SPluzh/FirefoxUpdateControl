@echo off
:: Disable Mozilla Firefox updates via registry
:: Requires administrator privileges

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required. Run as administrator.
    pause
    exit /b 1
)

:: Create Mozilla policy key (32-bit)
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla" /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to create Mozilla key
    pause
    exit /b 1
)

:: Create Firefox subkey (32-bit)
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla\Firefox" /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to create Firefox key
    pause
    exit /b 1
)

:: Create DisableAppUpdate DWORD (32-bit) = 1
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d 1 /f /reg:32
if %errorLevel% neq 0 (
    echo Failed to create DisableAppUpdate value
    pause
    exit /b 1
)

echo Settings applied successfully!
echo Firefox updates are now disabled.
echo Restart Firefox to apply changes.
pause
