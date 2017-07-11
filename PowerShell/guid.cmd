
echo off

FOR /F %%a IN ('POWERSHELL -COMMAND \"$([guid]::NewGuid().ToString())\"') DO   SET NEWGUID=%%a

echo zzz
echo %NEWGUID%
echo xxx

FOR /F %%a IN ('POWERSHELL -COMMAND \"$([guid]::NewGuid().ToString())\"') DO ( SET NEWGUIDx=%%a )

echo zzz
echo %NEWGUIDx%
echo xxx


echo(
SET /P HitEnter=Hit Any Key ... 
echo(
