# OpenSSH Bastion Host Node Execution Plugins

This plugin provides a node-executor and file-copier supporting ssh actions through a bastion host.
Use this plugin if you must access remote servers via a jump host.

## Dry run mode

You can configure the plugin to just print the invocation string to the console.
This can be useful when defining the configuration properties.

## Plugin Configuration Properties

* Bastion SSH Key Storage Path: Identity to use for the bastion host connection.
* SSH Options: Extra options to pass to the ssh command invocation
* ssh_conifig: Specify ProxyCommand and other flags. Consult the reference for [ssh_config(5)](https://linux.die.net/man/5/ssh_config) to learn about posible settings.
* Dry run? If set true, just print the command invocation that would be used but do not execute the command. This is useful to preview.

## Node Specific Key

If the node is configured with the `ssh-key-storage-path` attribute, the ssh connection will use that to connect to the remote node.

* ssh-key-storage-path: Set to location in Rundeck Keystore

### Configuration 

The plugin can be configured as a default node executor and file copier for a Project. Use the Simple Conguration tab to see the configuration properties. The page has a form with inputs to configure the connection to the bastion host.

You can also modify the project.properties or use the API/CLI to define the plugin configuration.
The Plugin List page will describe the key names to set.

#### Customize the ssh_config 

You can define multiple lines using a trailing backslash and an indent on the following line.

Here is an example that defines ssh_config file. 

    project.plugin.NodeExecutor.openssh-bastion-host.node-executor.ssh_config=Host * \
      StrictHostKeyChecking no
      Port 22
      ProxyCommand ssh user@bastionhost -W %h\:%p
      IdentityFile @plugin.config.identity_file@

Here ssh_options are set.

    project.plugin.NodeExecutor.openssh-bastion-host.node-executor.ssh_options="-q -oCiphers=arcfour -oClearAllForwardings=yes"


