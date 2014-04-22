@echo off

set BROWSER="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"

%BROWSER% ^
	-new-window ^
	http://holisticware.net/HolisticWare/Know-How.aspx ^
	http://holisticware.net/Composite/top.aspx ^
	"https://accounts.google.com/ServiceLogin?service=analytics&continue=https://www.google.com/analytics/web/?hl%3Den%26pli%3D1%23report%2Fvisitors-overview%2Fa21926652w43292483p43296220%2F" ^
	"https://www.google.com/a/holisticware.com/ServiceLogin?service=wise&passive=1209600&continue=https://drive.google.com/a/holisticware.com/%23my-drive" ^
	http://www.opinionatedgeek.com/dotnet/tools/htmlencode/encode.aspx ^
	http://translate.google.com/ ^
	"https://accounts.google.com/ServiceLogin?service=analytics&continue=https://www.google.com/analytics/web/?pli%3D1%23report%2Fvisitors-overview%2Fa21926652w43292483p43296220%2F%253Foverview-graphOptions.compareConcept%253Danalytics.bounceRate%2F" ^
	http://docs.composite.net/ ^
	"https://accounts.google.com/ServiceLogin?service=sitemaps&passive=1209600&continue=https://www.google.com/webmasters/tools/home?hl%3Den%26pli%3D1" ^
	"https://accounts.google.com/ServiceLogin?passive=1209600&continue=https://www.google.com/settings/account&followup=https://www.google.com/settings/account" ^
	https://github.com/moljac ^
	http://www.codeplex.com/ ^
	http://forums.xamarin.com/profile/119/moljac ^
	http://stackoverflow.com/users/1622340/moljac ^
	
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	
