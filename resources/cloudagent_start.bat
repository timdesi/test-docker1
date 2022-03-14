@echo off
rem
rem Copyright Bosch.IO GmbH 2021
rem All rights reserved, also regarding any disposal, exploitation,
rem reproduction, editing, distribution, as well as in the event of
rem applications for industrial property rights.
rem
rem This software is the confidential and proprietary information
rem of Bosch.IO GmbH. You shall not disclose
rem such Confidential Information and shall use it only in
rem accordance with the terms of the license agreement you
rem entered into with Bosch.IO GmbH.
rem

setlocal

rem Check if cloudagent is already started
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq cloudagent.exe"') DO IF %%x == cloudagent.exe echo Cloudagent already started, exiting^! & timeout 2 & EXIT 1

rem Configuration file in json format with flags values, configure with parameter -configFile.
if defined CLOUD_AGENT_CONFIG set "ARGUMENTS=%ARGUMENTS% -configFile=%CLOUD_AGENT_CONFIG%"

rem Connection string for the Azure IoT Hub connectivity, configure with parameter -connectionString.
if defined CONNECTION_STRING set "ARGUMENTS=%ARGUMENTS% -connectionString=%CONNECTIONS_STRING%"

rem ID Scope for the Azure DPS authentication, configure with parameter -idScope.
if defined ID_SCOPE set "ARGUMENTS=%ARGUMENTS% -idScope=%ID_SCOPE%"

rem The file for the message mappings configuration, configure with parameter -messageMapperConfig ("message-mapper-config.json").
if defined MESSAGE_MAPPER_CONFIG set "ARGUMENTS=%ARGUMENTS% -messageMapperConfig=%MESSAGE_MAPPER_CONFIG%"

rem The list of allowed local topics, configure with parameter -allowedLocalTopicsList.
if defined ALLOWED_LOCAL_TOPICS_LIST set "ARGUMENTS=%ARGUMENTS% -allowedLocalTopicsList=%ALLOWED_LOCAL_TOPICS_LIST%"

rem The list of allowed cloud message types, configure with parameter -allowedCloudMessageTypesList.
if defined ALLOWED_CLOUD_MESSAGE_TYPES_LIST set "ARGUMENTS=%ARGUMENTS% -allowedCloudMessageTypesList=%ALLOWED_CLOUD_MESSAGE_TYPES_LIST%"

rem User-specified tenant id, configure with parameter -tenantId (default "defaultTenant").
if defined TENANT_ID set "ARGUMENTS=%ARGUMENTS% -tenantId=%TENANT_ID%"

rem Address of the local MQTT broker, configure with parameter -localAddress (default "tcp://localhost:1883").
if defined LOCAL_ADDRESS set "ARGUMENTS=%ARGUMENTS% -localAddress=%LOCAL_ADDRESS%"

rem Username for authentication to the local client, configure with parameter -localUsername.
if defined LOCAL_USERNAME set "ARGUMENTS=%ARGUMENTS% -localUsername=%LOCAL_USERNAME%"

rem Password for authentication to the local client, configure with parameter -localPassword.
if defined LOCAL_PASSWORD set "ARGUMENTS=%ARGUMENTS% -localPassword=%LOCAL_PASSWORD%"

rem Path to Hub certificate, configure with parameter -cacert (default "iothub.crt").
if defined CA_CERT_PATH set "ARGUMENTS=%ARGUMENTS% -cacert=%CA_CERT_PATH%"

rem Log file location, configure with parameter -logFile (default "logs/log.txt")
if defined LOG_FILE set "ARGUMENTS=%ARGUMENTS% -logFile=%LOG_FILE%"

rem Log level, configure with parameter -logLevel.
rem Possible values: ERROR, WARN, INFO, DEBUG, TRACE (default "INFO").
if defined LOG_LEVEL set "ARGUMENTS=%ARGUMENTS% -logLevel=%LOG_LEVEL%"

rem Log file size in MB before it gets rotated, configure with parameter -logFileSize (default 2).
if defined LOG_FILE_SIZE set "ARGUMENTS=%ARGUMENTS% -logFileSize=%LOG_FILE_SIZE%"

rem Log file max rotations count, configure with parameter -logFileCount (default 5).
if defined LOG_FILE_COUNT set "ARGUMENTS=%ARGUMENTS% -logFileCount=%LOG_FILE_COUNT%"

rem Log file rotations max age in days, configure with parameter -logFileMaxAge (default 28).
if defined LOG_FILE_MAX_AGE set "ARGUMENTS=%ARGUMENTS% -logFileMaxAge=%LOG_FILE_MAX_AGE%"

echo %cd%\cloudagent.exe %ARGUMENTS%
start cloudagent.exe %ARGUMENTS%
