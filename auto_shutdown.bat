@echo off
set "target_time=19:00"
for /f "tokens=1-2 delims=:" %%a in ("%time%") do (
    set "current_hour=%%a"
    set "current_min=%%b"
)
for /f "tokens=1-2 delims=:" %%a in ("%target_time%") do (
    set "target_hour=%%a"
    set "target_min=%%b"
)

set /a "current_secs=(%current_hour%*3600) + (%current_min%*60)"
set /a "target_secs=(%target_hour%*3600) + (%target_min%*60)"
set /a "diff_secs=%target_secs% - %current_secs%"

if %diff_secs% leq 0 (
    echo 已經過了19:00，無法設定關機。
) else (
    echo 將在 %diff_secs% 秒後關機...
    shutdown /s /t %diff_secs%
)
pause
