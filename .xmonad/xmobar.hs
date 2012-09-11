-- xmobar config used by Xin Yang
-- Author: Xin Yang

-- This is setup for a single 1920x1080 monitor

Config { font = "xft:Yahei Mono:pixelsize=14"
       , bgColor = "black"
       , fgColor = "white"
       , position = TopW L 90
       , lowerOnStart = True
       , commands = [
           Run Weather "ZHHH" ["-t"," <tempC>C  <skyCondition>","-L","15","-H","25","-n","green","-h","red","-l","lightblue"] 36000
         , Run MultiCpu ["-t","Cpu: <total0>%+<total1>%", "-L", "10", "-H", "60", "-l", "lightblue", "-n", "white", "-h", "red"] 10
         -- , Run CpuFreq ["-t", " ", "-L", "0", "-H", "2", "-l", "lightblue", "-n","white", "-h", "red"] 50
         , Run Com "~/.xmonad/bin/getcoretemp" [] "coreTemp" 10
         -- , Run Cpu ["-L","10","-H","50","--normal","green","--high","red"] 10
         -- , Run Memory ["-t","Mem: <usedratio>%"] 10
         , Run Memory ["-t","Mem: <usedratio>%", "-H", "4096", "-L", "2048", "-h", "red", "-l", "lightblue", "-n", "white"] 10
         , Run Swap ["-t","Swap: <usedratio>%", "-H", "1024", "-L", "512", "-h", "red", "-l", "lightblue", "-n", "white"] 10
         -- , Run Wireless "wlan0" ["-t","wlan0: %","-L","0","-H","32","--normal","green","--high","red"] 10
         -- , Run Battery ["-t","Batt: %","-L","25","-H","75","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"] 600
         -- , Run Com "/home/xin/bin/getvolume" [] "myVolume" 10
         -- , Run Network "eth0" ["-L","0","-H","32","--normal","green","--high","red"] 10
         -- , Run Network "eth1" ["-L","0","-H","32","--normal","green","--high","red"] 10
         -- , Run Network "eth2" ["-L","0","-H","32","--normal","green","--high","red"] 10
         -- , Run Network "eth3" ["-L","0","-H","32","--normal","green","--high","red"] 10
         , Run Network "eth1" ["-t","Net: Down-<rx>KB, Up-<tx>KB", "-H", "200", "-L", "10", "-h", "red", "-l", "lightblue", "-n", "white"] 10
         , Run Date "%a %b %_d %l:%M" "date" 10
         -- , Run Com "uname" ["-s","-r"] "" 36000
         , Run StdinReader
         ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "<fc=yellow>xin @</fc> %StdinReader% }{ <fc=yellow>|</fc> %multicpu% (%coreTemp%) <fc=yellow>|</fc> %memory%  %swap% <fc=yellow>|</fc> %eth1% <fc=yellow>|</fc> <fc=#ee9a00>%date%</fc> <fc=yellow>|</fc> %ZHHH% <fc=yellow>|</fc>"
       -- , template = "%StdinReader% }{ %multicpu% %cpufreq% %coreTemp% %memory% %swap% %wlan0wi% %battery% Vol: %myVolume% Weather: %VOMM% %date%"
       -- , template = "%StdinReader% }{ %multicpu% %memory% %swap% | <fc=#ee9a00>%date%</fc> | Weather: %ZHHH%
       }
