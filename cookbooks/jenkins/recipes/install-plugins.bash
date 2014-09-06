#!/bin/bash -e

function install()
{
    local pluginList="${1}"

    if [[ "$(isEmptyString "${pluginList}")" = 'false' ]]
    then
        local appName="$(getFileName "${jenkinsDownloadURL}")"
        local jenkinsCLIPath="${jenkinsTomcatFolder}/webapps/${appName}/WEB-INF/jenkins-cli.jar"
        local jenkinsAppURL="http://127.0.0.1:${jenkinsTomcatHTTPPort}/${appName}"

        checkExistFile "${jenkinsCLIPath}"
        checkExistURL "${jenkinsAppURL}"

        java -jar "${jenkinsCLIPath}" -s "${jenkinsAppURL}" install-plugin ${pluginList}
        java -jar "${jenkinsCLIPath}" -s "${jenkinsAppURL}" safe-restart
    else
        info "No installs/updates available!"
    fi
}

function main()
{
    local appPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    source "${appPath}/../../../lib/util.bash"
    source "${appPath}/../attributes/default.bash"

    checkRequireSystem
    checkRequireRootUser

    header 'INSTALLING PLUGINS JENKINS'

    install
    installCleanUp
}

main "${@}"