@echo off
REM Run an arbitrary cargo command natively on Windows ARM64 through the VS ARM64 dev env.
REM Usage: cargo-arm64.bat test        |  cargo-arm64.bat install --path .
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" arm64
if errorlevel 1 exit /b 1
cd /d C:\dev\Projects\RTK
cargo %*
