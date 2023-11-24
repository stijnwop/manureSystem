SET filename="FS22_manureSystem.zip"

IF EXIST %filename% (
    DEL  %filename% > NUL
)

"7z.exe" a -tzip %filename% ^
   -i!*.lua ^
   -i!*.dds ^
   -i!*.i3d ^
   -i!*.i3d.shapes ^
   -i!*.grle ^
   -i!*.i3d.anim ^
   -i!*.ogg ^
   -i!*.xml ^
   -xr!$data ^
   -xr!Substance ^
   -xr!.mayaSwatches ^
   -xr!.idea ^
   -xr!docs ^
   -aoa -r ^

IF %ERRORLEVEL% NEQ 0 ( exit 1 )
