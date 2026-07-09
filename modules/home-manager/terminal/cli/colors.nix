{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dwt1-shell-color-scripts
    rgrc
  ];

  home.shellAliases = {
    df = "rgrc df";
    mount = "rgrc mount";
    ps = "rgrc ps aux";
    netstat = "rgrc netstat";
    ping = "rgrc ping";
    traceroute = "rgrc traceroute";
    diff = "rgrc diff";
    last = "rgrc last";
    ifconfig = "rgrc ifconfig";
    ip = "rgrc ip";
    du = "rgrc du";
    free = "rgrc free";
    uptime = "rgrc uptime";
    blkid = "rgrc blkid";
    curl = "rgrc curl";
    env = "rgrc env";
    fdisk = "rgrc fdisk";
    findmnt = "rgrc findmnt";
    gcc = "rgrc gcc";
    getfacl = "rgrc getfacl";
    id = "rgrc id";
    iptables = "rgrc iptables";
    journalctl = "rgrc journalctl --no-pager | less -R";
    lsattr = "rgrc lsattr";
    lsblk = "rgrc lsblk";
    lsmod = "rgrc lsmod";
    lspci = "rgrc lspci";
    sensors = "rgrc sensors";
    ss = "rgrc ss";
    stat = "rgrc stat";
    sysctl = "rgrc sysctl";
    systemctl = "rgrc systemctl";
    tail = "rgrc tail";
    tune2fs = "rgrc tune2fs";
    vmstat = "rgrc vmstat";
    go = "rgrc go";
  };
}
