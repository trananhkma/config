@echo off
REM 1. Create file alias.cmd
REM 2. open regedit > HKEY_LOCAL_MACHINE > SOFTWARE > Microsoft > Command Processor
REM 3. Add new String Value. Name: AutoRun; Data: Path_to_alias.cmd

DOSKEY alias=notepad %USERPROFILE%\alias.cmd

DOSKEY cdm=D: ^& cd D:\Hacking\me
DOSKEY cdh=D: ^& cd D:\Hacking
DOSKEY cdu=C: ^& cd %USERPROFILE%

DOSKEY l=dir /B
DOSKEY ls=dir /B
DOSKEY ll=dir /B

DOSKEY clear=cls

DOSKEY gdf=git diff $*
DOSKEY gcm=git commit $*
DOSKEY gcl=git clone $*
DOSKEY gbr=git branch $*
DOSKEY gck=git checkout $*

DOSKEY gst=git status
DOSKEY gpull=git pull
DOSKEY gpush=git push
DOSKEY gpushdev=git push origin develop
DOSKEY gpushmas=git push origin master

DOSKEY cat=type $*

DOSKEY mkg=python manage.py makemigrations $*
DOSKEY mg=python manage.py migrate $*

DOSKEY dps=docker ps $*
DOSKEY dimg=docker images
DOSKEY drmi=docker rmi $*
DOSKEY dstart=docker start $*
DOSKEY dstop=docker stop $*
DOSKEY dexec=docker exec -it $*
