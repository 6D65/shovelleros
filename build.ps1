# 
# Very machine specific.
#

Write-Host "=> Adding the JDK 1.7 as the default JDK to the path`r`n"
$env:Path = "C:\Program Files\Java\jdk1.7.0_80\bin;" + $env:Path

Write-Host "=> Compiling the project for the web.`r`n"
cocos compile -p web -m release --advanced

Write-Host "`r`n=> Copy the compiled HTML5 game to Shovellers appengine folder"

Copy-Item ".\publish\html5\*" ".\shovellers-766\static" -recurse

cd shovellers-766
goapp deploy -oauth -application shovellers-766

cd ..