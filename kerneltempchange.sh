#list all kernel switches
sysctl -a
#switching some CD-ROM options
sysctl -w dev.cdrom.info = Can Write CD-RW: 1
sysctl -w dev.cdrom.autoeject = 1
