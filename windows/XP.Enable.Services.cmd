sc config ALG start= automatic
net start ALG

sc config wuauserv start= automatic
net start wuauserv

sc config wltrysvc start= automatic
net start wltrysvc

sc config TrkWks start= automatic
net start TrkWks

sc config ERSvc start= automatic
net start ERSvc

sc config FastUserSwitchingCompatibility start= automatic
net start FastUserSwitchingCompatibility

sc config helpsvc start= automatic
net start helpsvc

sc config Nla start= automatic
net start Nla

sc config Spooler start= automatic
net start Spooler

sc config RemoteRegistry start= automatic
net start RemoteRegistry

sc config wscsvc start= automatic
net start wscsvc

sc config SSDPSRV start= automatic
net start SSDPSRV

sc config srservice start= automatic
net start srservice

sc config Schedule start= automatic
net start Schedule

sc config TermService start= automatic
net start TermService

sc config Themes start= automatic
net start Themes

sc config WebClient start= automatic
net start WebClient

sc config SharedAccess start= automatic
net start SharedAccess

sc config LanmanServer start= automatic
net start LanmanServer

sc config lanmanworkstation start= automatic
net start lanmanworkstation

sc config W32Time start= automatic
net start W32Time

sc config Browser start= automatic
net start Browser

sc config wzcsvc start= automatic
net start wzcsvc

sc config C2PCSetTimeServer start= automatic
net start C2PCSetTimeServer

sc config C2PCGatewayWebService start= automatic
net start C2PCGatewayWebService

set /p SNINJECTOR= "Remove SNInjector? (Y/N)"
set /p TRANSLATOR= "Remove Translator? (Y/N)"
set /p SHANET= "Remove SharedNet? (Y/N)"

IF "%SNINJECTOR%" == "Y" (
C:\SNInjector\uninstall.bat
del /Q C:\SNInjector
)

IF "%TRANSLATOR%" == "Y" (
del /Q C:\Translator
)

IF "%SHANET%" == "Y" (
del /Q C:\SharedNet
)

pause


