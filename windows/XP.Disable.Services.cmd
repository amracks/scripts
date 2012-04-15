net stop ALG
sc config ALG start= disabled

net stop wuauserv
sc config wuauserv start= disabled

net stop wltrysvc
sc config wltrysvc start= disabled

net stop TrkWks
sc config TrkWks start= disabled

net stop ERSvc
sc config ERSvc start= disabled

net stop FastUserSwitchingCompatibility
sc config FastUserSwitchingCompatibility start= disabled

net stop helpsvc
sc config helpsvc start= disabled

net stop Nla
sc config Nla start= disabled

net stop Spooler
sc config Spooler start= disabled

net stop RemoteRegistry
sc config RemoteRegistry start= disabled

net stop wscsvc
sc config wscsvc start= disabled

net stop SSDPSRV
sc config SSDPSRV start= disabled

net stop srservice
sc config srservice start= disabled

net stop Schedule
sc config Schedule start= disabled

net stop TermService
sc config TermService start= disabled

net stop Themes
sc config Themes start= disabled

net stop WebClient
sc config WebClient start= disabled

net stop SharedAccess
sc config SharedAccess start= disabled

rem net stop LanmanServer
rem sc config LanmanServer start= disabled

rem net stop lanmanworkstation
rem sc config lanmanworkstation start= disabled

net stop W32Time
sc config W32Time start= disabled

pause
