@echo off
REM Build rtk natively on Windows ARM64.
REM MUST run through the VS ARM64 dev environment — a plain Git Bash shell
REM fails cc-rs's MSVC auto-discovery on the aarch64 host (bundled SQLite won't compile).
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" arm64
if errorlevel 1 exit /b 1
cd /d C:\dev\Projects\RTK
REM debug build; swap for `cargo build --release` for the optimized binary
cargo build %*
