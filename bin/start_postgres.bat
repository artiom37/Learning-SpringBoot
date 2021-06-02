SET server=localhost
::SET /P server="Server [%server%]: "

REM SET database=postgres
SET database=dev
::SET /P database="Database [%database%]: "

SET port=5432
::SET /P port="Port [%port%]: "

SET username=postgres
::SET /P username="Username [%username%]: "

for /f "delims=" %%a in ('chcp ^|find /c "932"') do @ SET CLIENTENCODING_JP=%%a
if "%CLIENTENCODING_JP%"=="1" SET PGCLIENTENCODING=SJIS
if "%CLIENTENCODING_JP%"=="1" SET /P PGCLIENTENCODING="Client Encoding [%PGCLIENTENCODING%]: "

REM Run psql
"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h %server% -U %username% -d %database% -p %port%

pause 5


"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h %server% -p %port% -U %username% -d %database% -f schema.sql
"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h %server% -p %port% -U %username% -d %database% -f data.sql
::psql -U postgres -d dev -h localhost -f data.sql;