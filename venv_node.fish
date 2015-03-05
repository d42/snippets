function deactivate_node

    if test -n "$_OLD_NODE_VIRTUAL_PATH"
        set -xg NPM_CONFIG_PREFIX $_OLD_NPM_CONFIG_PREFIX
        set -xg npm_config_prefix $_OLD_npm_config_prefix

        set -e $_OLD_npm_config_prefix
        set -e $_OLD_NPM_CONFIG_PREFIX
    end

    if test "$argv[1]" != "nondestructive"
        functions -e deactivate_node
    end
end

set -l NODE_VIRTUAL_ENV (dirname (status -f))

set _OLD_NPM_CONFIG_PREFIX "$NPM_CONFIG_PREFIX"
set _OLD_npm_config_prefix "$npm_config_prefix"
set -x NPM_CONFIG_PREFIX "$NODE_VIRTUAL_ENV"
set -x npm_config_prefix "$NODE_VIRTUAL_ENV"
