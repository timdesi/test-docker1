#!/bin/sh

#
# Copyright Bosch.IO GmbH 2021
# All rights reserved, also regarding any disposal, exploitation,
# reproduction, editing, distribution, as well as in the event of
# applications for industrial property rights.
#
# This software is the confidential and proprietary information
# of Bosch.IO GmbH. You shall not disclose
# such Confidential Information and shall use it only in
# accordance with the terms of the license agreement you
# entered into with Bosch.IO GmbH.
#

# Check if cloudagent is already started
[ -n "`pidof cloudagent`" ] && { echo "Cloudagent already started, exiting!"; exit 1; }

# Configuration file in json format with flags values, configure with parameter -configFile.
[ -n "${CLOUD_AGENT_CONFIG+x}" ] && ARGUMENTS="$ARGUMENTS -configFile=$CLOUD_AGENT_CONFIG"

# Connection string for the Azure IoT Hub connectivity, configure with parameter -connectionString.
[ -n "${CONNECTION_STRING+x}" ] && ARGUMENTS="$ARGUMENTS -connectionString=$CONNECTION_STRING"

# ID Scope for the Azure DPS authentication, configure with parameter -idScope.
[ -n "${ID_SCOPE+x}" ] && ARGUMENTS="$ARGUMENTS -idScope=$ID_SCOPE"

# The file for the message mappings configuration, configure with parameter -messageMapperConfig (default "message-mapper-config.json").
[ -n "${MESSAGE_MAPPER_CONFIG+x}" ] && ARGUMENTS="$ARGUMENTS -messageMapperConfig=$MESSAGE_MAPPER_CONFIG"

# The list of allowed local topics, configure with parameter -allowedLocalTopicsList.
[ -n "${ALLOWED_LOCAL_TOPICS_LIST+x}" ] && ARGUMENTS="$ARGUMENTS -allowedLocalTopicsList=$ALLOWED_LOCAL_TOPICS_LIST"

# The list of allowed cloud message types, configure with parameter -allowedCloudMessageTypesList.
[ -n "${ALLOWED_CLOUD_MESSAGE_TYPES_LIST+x}" ] && ARGUMENTS="$ARGUMENTS -allowedCloudMessageTypesList=$ALLOWED_CLOUD_MESSAGE_TYPES_LIST"

# User-specified tenant id, configure with parameter -tenantId (default "defaultTenant").
[ -n "${TENANT_ID+x}" ] && ARGUMENTS="$ARGUMENTS -tenantId=$TENANT_ID"

# Address of the local MQTT broker, configure with parameter -localAddress (default "tcp://localhost:1883").
[ -n "${LOCAL_ADDRESS+x}" ] && ARGUMENTS="$ARGUMENTS -localAddress=$LOCAL_ADDRESS"

# Username for authentication to the local client, configure with parameter -localUsername.
[ -n "${LOCAL_USERNAME+x}" ] && ARGUMENTS="$ARGUMENTS -localUsername=$LOCAL_USERNAME"

# Password for authentication to the local client, configure with parameter -localPassword.
[ -n "${LOCAL_PASSWORD+x}" ] && ARGUMENTS="$ARGUMENTS -localPassword=$LOCAL_PASSWORD"

# Path to Hub certificate, configure with parameter -cacert (default "iothub.crt").
[ -n "${CA_CERT_PATH+x}" ] && ARGUMENTS="$ARGUMENTS -cacert=$CA_CERT_PATH"

# Log file location, configure with parameter -logFile (default "logs/log.txt")
[ -n "${LOG_FILE+x}" ] && ARGUMENTS="$ARGUMENTS -logFile=$LOG_FILE"

# Log level, configure with parameter -logLevel.
# Possible values: ERROR, WARN, INFO, DEBUG, TRACE (default "INFO").
[ -n "${LOG_LEVEL+x}" ] && ARGUMENTS="$ARGUMENTS -logLevel=$LOG_LEVEL"

# Log file size in MB before it gets rotated, configure with parameter -logFileSize (default 2).
[ -n "${LOG_FILE_SIZE+x}" ] && ARGUMENTS="$ARGUMENTS -logFileSize=$LOG_FILE_SIZE"

# Log file max rotations count, configure with parameter -logFileCount (default 5).
[ -n "${LOG_FILE_COUNT+x}" ] && ARGUMENTS="$ARGUMENTS -logFileCount=$LOG_FILE_COUNT"

# Log file rotations max age in days, configure with parameter -logFileMaxAge (default 28).
[ -n "${LOG_FILE_MAX_AGE+x}" ] && ARGUMENTS="$ARGUMENTS -logFileMaxAge=$LOG_FILE_MAX_AGE"

echo $PWD/cloudagent $ARGUMENTS
nohup $PWD/cloudagent $ARGUMENTS >/dev/null 2>&1 &
nohup ./cloudagent $ARGUMENTS
#./cloudagent $ARGUMENTS
