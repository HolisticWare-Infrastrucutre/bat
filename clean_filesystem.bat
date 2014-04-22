echo off

@FOR /R c:\ %%d IN (*.bak *.tmp) DO (
	echo %%d
	del "%%d"
)

@FOR /R d:\ %%d IN (*.bak *.tmp) DO (
	echo %%d
	del "%%d"
)

@FOR /R e:\ %%d IN (*.bak *.tmp) DO (
	echo %%d
	del %%d
)
