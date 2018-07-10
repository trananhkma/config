@echo off

DOSKEY alias=notepad %USERPROFILE%\alias.cmd

DOSKEY cdp=E: ^& cd E:\projects
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
