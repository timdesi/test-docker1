@echo off
rem
rem Copyright Bosch.IO GmbH 2020
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

rem kill with /F option, otherwise the process could not be terminated
taskkill /F /im cloudagent.exe
