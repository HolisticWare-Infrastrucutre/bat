# 

#---------------------------------------------------------------------------------------------------
# mono
export PATH=/Library/Frameworks/Mono.framework/Commands/:/usr/local/share/dotnet/:$PATH

#---------------------------------------------------------------------------------------------------
# dotnet
export PATH=/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share:/usr/local/share/dotnet

#---------------------------------------------------------------------------------------------------
# python/R
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Sys.setlocale(category="LC_ALL", locale = "en_US.UTF-8")


# .bash_profile
alias clear-nuget-cache='rm -rf ~/.nuget/packages/*; rm -rf ~/.local/share/NuGet/Cache; rm -rf ~/.local/share/NuGet/v3-cache'
