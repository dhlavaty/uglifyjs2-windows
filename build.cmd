:: This file was derived from it's original project 'https://github.com/duncansmart/less.js-windows' by Duncan Smart
@echo off
pushd "%~dp0\bin"

:: Update node.exe
if not exist node.exe (
    echo Downloading latest node.exe
    cscript //nologo "%~dp0\tools\httpget.js" http://nodejs.org/dist/latest/node.exe node.exe
)

:: Install/Update uglify (assumes npm is installed globally)
if exist "node_modules\uglify-js" (
    echo Updating UglifyJS2
    call npm update uglify-js --quiet
) else (
    echo Installing UglifyJS2
    call npm install uglify-js --quiet
)

:: Due to the way node_modues work, the directory depth can get very deep and go beyond MAX_PATH (260 chars). 
:: Therefore grab all node_modues directories and move them up to baseNodeModuleDir. Node's require() will then 
:: traverse up and find them at the higher level. Should be fine as long as there are no versioning conflicts.
:FLATTEN_NODE_MODULES
echo Flatenning node_modules
set BASE_MODULES=%~dp0bin\node_modules
pushd "%BASE_MODULES%"
for /l %%I in (1,1,3) do (
    for /d /r %%D in (node_modules) do if exist %%D (
        pushd "%%D"
        for /d %%M in (*) do (
            rem echo %%~dpnM
            move /y "%%M" "%BASE_MODULES%\%%M" >nul
        )
        popd
        rmdir "%%D"
    )
)

:: clean varous junk directories from node_modules
:CLEAN_NODE_MODULES
echo Cleaning node_modules
for /d /r %%D in (*) do  (
    rem echo %%D
    if "%%~nD"=="build" rd /s /q "%%D"
    if "%%~nD"=="images" rd /s /q "%%D"
    if "%%~nD"=="example" rd /s /q "%%D"
    if "%%~nD"=="tests" rd /s /q "%%D"
    if "%%~nD"=="test" rd /s /q "%%D"
    if "%%~nD"=="tst" rd /s /q "%%D"
    if "%%~nD"=="tmp" rd /s /q "%%D"
    if "%%~nD"=="man" rd /s /q "%%D"
)

:PACKAGE
echo Creating uglifyjs2-release.zip
set ZIP="%~dp0tools\7-zip\7za.exe"
set RELEASE_ZIP="%~dp0uglifyjs2-release.zip"
pushd "%~dp0"
if exist %RELEASE_ZIP% del %RELEASE_ZIP%
%ZIP% a %RELEASE_ZIP% bin\* -i!uglifyjs2.cmd -i!LICENSE -i!README.md >nul
popd

popd
