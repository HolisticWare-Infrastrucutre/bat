defrag -cvw

exit

for /L %%D in (1,1,10) do (
		defrag.exe /v /f c:
		defrag.exe /v /f d:
		defrag.exe /v /f e:
	)
