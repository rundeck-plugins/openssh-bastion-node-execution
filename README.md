# Deprecated

This repository is no longer maintained and is only avaiable for historical example purposes.  It will be deleted at some point in the future.

# OpenSSH Bastion Host Node Execution Plugins

This plugin provides a node-executor and file-copier supporting ssh actions through a bastion host.
Use this plugin if you must access remote servers via a jump host.

## Plugin Configuration Properties

* Bastion SSH Key Storage Path: Identity to use for the bastion host connection.
* SSH Options: Extra options to pass to the ssh command invocation. 
  You can overwrite this attribute at node level, using ssh-bastion-ssh-config (node-executor) and scp-bastion-ssh-config (file-copier).
* Bastion host: YOur jump server IP
* Bastion User: Username to login at bastion host

## Node Specific Key

If the node is configured with the `ssh-key-storage-path` attribute, the ssh connection will use that to connect to the remote node.

* ssh-key-storage-path: Set to location in Rundeck Keystore

## Node Specific username

If the node is configured with the `username` attribute, the ssh connection will use that to connect to the remote node.


## Configuration 

The plugin can be configured as a default node executor and file copier for a Project. Use the Simple Conguration tab to see the configuration properties. The page has a form with inputs to configure the connection to the bastion host.

You can also modify the project.properties or use the API/CLI to define the plugin configuration.
The Plugin List page will describe the key names to set.

For those who prefer to use configurations at node resource level, its possible now to setup this plugin using node attributes.

# Docker Example

To star the docker example:

* Run `./start-docker-example.sh`
* Got to `http://localhost:8080`
* User/Password => admin/admin

The example has two networks:

* Network1: rundeck, bastion
* Network2: bastion, linux-1 (running on port 2223), linux-2 (running on default port)

The goal of this example is that Rundeck connects to the nodes linux-1 and linux-2 through the bastion container (Rundeck cannot see linux-X nodes).
Notices the node attribute for "linux-1" node, we set the port connection on the "SSH Options" at the node level.
