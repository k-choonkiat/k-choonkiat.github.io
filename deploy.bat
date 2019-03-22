@echo off

REM build
call npm run build || goto :error


REM navigate into the build output directory
cd dist  || goto :error

git init  || goto :error
git add -A  || goto :error
git commit -m 'deploy'  || goto :error

REM if you are deploying to https://k_choonkiat.github.io/VueTemplate
REM [TODO] : Replace with your username and Repository name
git push -f git push -f <paste-your-link-here> master:gh-pages || goto :error 

cd -  || goto :error

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%
