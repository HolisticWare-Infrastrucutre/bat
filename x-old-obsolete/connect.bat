REM first disconnect G: drive, needed for maskhouse.b

set HOST_SHARE=\\161.53.3.53\RIZExciterDB
set USER=mbenco\mcvjetko	

::net use w: /delete

:: HiT server
:: net use s: /delete
:: net use s: \\%HOST_SHARE% mcvjetko /USER:%USER%

:: DRM
net use z: /delete
net use z: %HOST_SHARE% mcvjetko /USER:%USER% /PERSISTENT:yes

::---------------------------------------------------------------
set HOST_SHARE=\\161.53.3.200\Konstrukcija
set USER=riztrans\dcvjetko	
:: RIZ
net use r: /delete
net use r: %HOST_SHARE% dcvjetko /USER:%USER% /PERSISTENT:yes

::---------------------------------------------------------------
set HOST_SHARE=\\161.53.3.200\razmjena
set USER=riztrans\dcvjetko	
:: RIZ
net use r: /delete
net use r: %HOST_SHARE% dcvjetko /USER:%USER% /PERSISTENT:yes

::pause

set HOST_SHARE=
set USER=