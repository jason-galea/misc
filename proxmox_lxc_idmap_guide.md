## How to configure `lxc.idmap` for LXC containers in Proxmox

This guide shows how to map UID/GID 1001 to one (or more) LXC containers.

The purpose is to allow LXC containers to write to some underlying directory of the host system,
by assuming the permissions of a host user/group.

For this guide:
- ID: `1001`
- Host directory: `/tank/media`


### References
- https://pve.proxmox.com/wiki/Unprivileged_LXC_containers


### 1 - Create user on host system

    $ cat /etc/passwd

    ...
    shared:x:1001:1001::/home/shared:/usr/bin/bash


### 2 - Set permissions for target directory on host system

    $ ls -lhan /tank/media/

    drwxrwxr-x 18 1001 1001   22 Nov 21 20:01  .
    drwxr-xr-x  8    0    0    9 Sep 30  2022  ..
    ...


### 3 - Modify `subuid` & `subgid` files on host system

These may already exist, so make sure not to overwrite the `root:100000:65536` line

    $ cat /etc/subuid

    root:100000:65536
    root:1001:1

    $ cat /etc/subgid

    root:100000:65536
    root:1001:1


### 4 - Add mounts to LXC config file

    $ cat /etc/pve/lxc/104.conf

    mp0: /tank/media,mp=/media
    ...
    unprivileged: 1
    lxc.idmap: u 0 100000 1001
    lxc.idmap: g 0 100000 1001
    lxc.idmap: u 1001 1001 1
    lxc.idmap: g 1001 1001 1
    lxc.idmap: u 1002 101002 64530
    lxc.idmap: g 1002 101002 64530


### 5 - Start your container!

    $ lxc-start 104

If you run into trouble, you can see more detailed errors with:

    $ lxc-start -F --logpriority=DEBUG 104


