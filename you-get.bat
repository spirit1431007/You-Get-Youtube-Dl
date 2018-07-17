@echo off
::设定You-Get和Youtube-DL的位置，可以根据自己的python安装目录修改
set youget=C:\Users\spiri\AppData\Local\Programs\Python\Python37\Scripts\you-get.exe
set youtubedl=C:\Users\spiri\AppData\Local\Programs\Python\Python37\Scripts\youtube-dl.exe

echo.&echo.视频下载工具，可以用You-Get与Youtube-DL下载媒体
:X
echo.&echo.
set /p URL=请输入要URL并回车:

echo engine List
echo 1.You-Get
echo 2.Youtube-DL
echo 3.更新（安装）下载引擎
set /p engine=请选择下载引擎或操作：
if="%engine%"=="1" goto A
if="%engine%"=="2" goto B
if="%engine%"=="3" goto C

:A
echo You-Get List
echo 10.You-Get   下载到C:\You-Get\Download，不使用代理
echo 11.You-Get   下载到C:\You-Get\Download，使用代理
set /p choose=请选择相应的处理方式：
if "%choose%"=="11" set OP=--socks-proxy 127.0.0.1:1080

:YouGetDown
%youget% %OP% %URL% -i
set /p itag=挑选想要下载的itag(format)，留空则为默认：

%youget% %OP% --itag=%itag% %URL% -o C:\You-Get\Download
goto X

:B
echo YoutubeDL List
echo 20.YoutubeDL 下载到C:\You-Get\Download，不使用代理
echo 21.YoutubeDL 下载到C:\You-Get\Download，使用代理
set /p choose=请选择相应的处理方式：
if "%choose%"=="21" set OP1= --proxy socks5://127.0.0.1:1080

:youtubedlDown
%youtubedl% %OP1% -F %URL%  
set /p itag=挑选自己的组合（中间用加号），留空则为默认：

%youtubedl% -f %itag% %URL% -o "C:\You-Get\Download\%%(title)s.%%(ext)s"
goto X

:C
pip3 install you-get
pip3 install --upgrade you-get
pip3 install youtube-dl
pip3 install --upgrade youtube-dl
goto X
