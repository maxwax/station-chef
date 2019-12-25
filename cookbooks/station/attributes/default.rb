# Attributes file for station

node.default['station']['user'] = {
  "username": "maxwell",
  "group": "maxwell",
  "uid": "1000",
  "gid": "1000",
  'mode': 0755,
  'personal_bin_scripts': [
    "bootstrap-maxlab",
    "erase-node",
    "clean-history",
    "git-run-meld",
    "goatari",
    "library-sync",
    "reset-evolution",
    "reset-gnome"
  ],
  "personal_dot_files": [
    "bashrc",
    "bash_profile",
    "gitconfig",
    "position-config",
    "santoku-config",
    "coding-config",
    "vimrc"
  ],
  "firewall": {
    "default_zone": "public",
    "services_allowed": [
      "ssh",
      "samba-client",
      "dhcpv6-client",
      "mdns"
    ],
    "ports_allowed": [
    ]
  }
}

node.default['station']['root'] = {
  "username": "root",
  'personal_bin_scripts': [
  ],
  "personal_dot_files": [
    "bashrc",
    "vimrc"
  ]
}

node.default['station']['etc_config'] = [
  "nas.conf",
  "vital-backup.conf"
]

node.default['station']['usr_local'] = {
  "cookbook_scripts": {
    "bin": [
    ],
    "etc": [
      "shell-basics",
      "shell-history",
      "shell-prompt-powerline"
    ],
    "sbin": [
    ]
  },
  "remote_scripts": {
    "bin": {
      "coding": {
        "source": "https://github.com/maxwax/coding/archive",
        "filename": "v0.1.1.tar.gz",
        "version": "0.1.1",
        "file_type": "tgz",
        "install_script": "install.sh"
      },
      "position": {
        "source": "https://github.com/maxwax/position/archive",
        "filename": "v0.1.0.tar.gz",
        "version": "0.1.0",
        "file_type": "tgz",
        "install_script": "install.sh"
      }
    },
    "sbin": {
      "nas": {
        "source": "https://github.com/maxwax/nas/archive",
        "filename": "v1.1.0.tar.gz",
        "version": "1.1.0",
        "file_type": "tgz",
        "install_script": "install.sh"
      },
      "safe": {
        "source": "https://github.com/maxwax/safe/archive",
        "filename": "v2.0.0.tar.gz",
        "version": "2.0.0",
        "file_type": "tgz",
        "install_script": "install.sh"
      },
      "vital-backup": {
        "source": "https://github.com/maxwax/vital-backup/archive",
        "filename": "v1.1.0.tar.gz",
        "version": "1.1.0",
        "file_type": "tgz",
        "install_script": "install.sh"
      }
    }
  }
}

node.default['station']['mount_points'] = {
  "/net": [
    "auxdata",
    "filerdata",
    "auxroot",
    "audiovideo",
    "avarchive",
    "laptopnas",
    "teragreen",
    "filer-offsite4tb",
    "aux-offsite4tb",
    "laptop-auxdata",
    "xfiles"
  ],
  "/mnt": [
    "usb",
    "secure"
  ]
}

node.default['station']['virtualbox'] = {
  "version": "6.1",
  "package_name": "VirtualBox-6.1",
  "repo_source": "https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo",
  "source": "https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo",
  "signing_key_source": "https://www.virtualbox.org/download/oracle_vbox.asc",
  "signing_key_fname": "oracle_vbox.asc"
}

node.default['station']['atom'] = {
  "package_name": "atom.x86_64.rpm",
  "rpm_source": "https://atom.io/download/rpm"
}

plat_vers = "#{node['platform']}_#{node['platform_version']}"

case plat_vers
  when 'fedora_31'
    # List of repositories that should be installed by
    # downloading and installing packages
    node.default['station']['repo_packages'] = {
      "rpmfusion": {
        "free": {
          "pkg_name": "rpmfusion-free-release",
          "path": "rpmfusion-free-release-31.noarch.rpm",
          "source": "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-31.noarch.rpm"
        },
        "nonfree": {
          "pkg_name": "rpmfusion-nonfree-release",
          "path": "rpmfusion-nonfree-release-31.noarch.rpm",
          "source": "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-31.noarch.rpm"
        }
      }
    }

    # List of default packages to be installed for this Platform+Version
    node.default['station']['install_packages'] = [
        "amule",
        "atari++",
        "autodownloader",
        "banshee",
        "bonnie++",
        "calibre",
        "catdoc",
        "cdi-api",
        "darktable",
        "dkms",
        "docker",
        "docker-compose",
        "docker-vim",
        "easytag",
        "ebook-tools-libs",
        "ed",
        "evolution",
        "evolution-help",
        "evolution-langpacks",
        "exfat-utils",
        "expat",
        "expect",
        "f29-backgrounds-base",
        "f29-backgrounds-gnome",
        "f30-backgrounds-base",
        "f30-backgrounds-gnome",
        "f31-backgrounds-base",
        "f31-backgrounds-gnome",
        "faac",
        "faad2-libs",
        "ffmpeg",
        "ffmpeg-libs",
        "fio",
        "firewall-config",
        "freeipmi",
        "freetype",
        "fuse3",
        "fuse3-libs",
        "fuse-exfat",
        "fuse-overlayfs",
        "gcolor2",
        "gftp",
        "gimp",
        "gimp-data-extras",
        "gimp-libs",
        "gitg",
        "gitg-libs",
        "gnupg",
        "gnome-shell-extension-freon",
        "gnome-shell-extension-openweather",
        "gnome-shell-extension-launch-new-instance",
        "golang",
        "golang-bin",
        "golang-src",
        "gparted",
        "GraphicsMagick",
        "grip",
        "grizzly",
        "grubby",
        "gstreamer1",
        "gstreamer1-libav",
        "gstreamer1-plugins-bad-freeworld",
        "gstreamer1-plugins-base",
        "gstreamer1-plugins-base-tools",
        "gstreamer1-plugins-good-extras",
        "gstreamer1-plugins-ugly",
        "gstreamer-ffmpeg",
        "gtkimageview",
        "hddtemp",
        "hdparm",
        "hfsutils",
        "ImageMagick",
        "info",
        "ipmitool",
        "iptraf-ng",
        "jnettop",
        "jq",
        "kde-cli-tools",
        "kdenlive",
        "keepassx",
        "lame",
        "lftp",
        "lm_sensors",
        "lsscsi",
        "meld",
        "mencoder",
        "minicom",
        "minizip",
        'moby-engine',
        'moby-engine-vim',
        "mp3splt",
        "mplayer",
        "mplayer-common",
        "mplayer-gui",
        "mtr-gtk",
        "nmap",
        "pass",
        "patch",
        "pidgin",
        "pidgin-libnotify",
        "pidgin-logviewer",
        "pidgin-otr",
        "pidgin-sipe",
        "pitivi",
        "podman",
        "podman-manpages",
        "powerline",
        "powerline-fonts",
        "powertop",
        "proxychains-ng",
        "purple-sipe",
        "pv",
        "remmina",
        "remmina-plugins-exec",
        "remmina-plugins-nx",
        "remmina-plugins-rdp",
        "remmina-plugins-secret",
        "remmina-plugins-st",
        "remmina-plugins-vnc",
        "remmina-plugins-xdmcp",
        "samba",
        "samba-common-tools",
        "screenfetch",
        "seahorse",
        "sen",
        "signon",
        "signon-plugin-oauth2",
        "smartmontools",
        "smplayer",
        "sox",
        "strace",
        "sysstat",
        "telepathy-glib",
        "terminator",
        "tigervnc-server",
        "thunderbird",
        "ufraw-common",
        "ufraw-gimp",
        "unetbootin",
        "unrar",
        "usbview",
        "vagrant",
        "video-downloader",
        "vim-go",
        "vim-powerline",
        "vim-X11",
        "virt-manager",
        "virt-manager-common",
        "virt-top",
        "virt-viewer",
        "virt-what",
        "vlc",
        "vlc-core",
        "wireshark",
        "wireshark-cli",
        "wmctrl",
        "wodim"
      ]

# This isn't working for unknown reasons 2019-12-18
# Could be a Fedora | DNF issue, so test elsewhere first
      # # List of default packages to be installed for this Platform+Version
      # node.default['station']['install_packages_versions'] = [
      #     "wmctrl": "1.07-27.fc31"
      # ]

    # List of packages to be removed for this Package+Version
    node.default['station']['remove_packages'] = [
      ]

end