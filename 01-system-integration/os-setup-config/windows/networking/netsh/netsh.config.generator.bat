::cd c:\windows\system32

netsh diag gui

netsh interface ip dump > netconfig.new.txt

notepad netconfig.new.txt

