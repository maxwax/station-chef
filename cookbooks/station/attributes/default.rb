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
    "reset-gnome",
    "update-maxlab-chef",
    "tuncloud",
    "sshcloud",
  ],
  "personal_dot_files": [
    "bashrc",
    "bash_profile",
    "gitconfig",
    "position.conf",
    "santoku.conf",
    "coding.conf",
    "vimrc"
  ],
  "proxychains-ng": {
    "config_dir": ".proxychains",
    "symlink_source": "proxychains.conf",
    "symlink_dest": "proxychains-tunnel1.conf",
    "config_files": [
    "proxychains-tunnel1.conf",
    "proxychains-tunnel2.conf"
    ]
  },
  "roxterm": {
    "deploy_dir": ".config/roxterm.sourceforge.net",
    "source_dir": "home/config/roxterm.sourceforge.net",
    "config_files": {
      "Colours": [
        "solarized-dark",
        "solarized-light"
      ],
      "Profiles": [
        "maxlab"
      ]
    }
  }
}

node.default['station']['firewall'] =
{
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

node.default['station']['root'] = {
  "username": "root",
  'personal_bin_scripts': [
  ],
  "personal_dot_files": [
    "bashrc",
    "vimrc",
    "hot-tub-timemachine.conf"
  ]
}

node.default['station']['shortcuts'] = {
  "dir": "/usr/share/applications/station",
  "files": [
    "left",
    "right",
    "mid",
    "west",
    "east",
    "center",
    "test",
    "place",
    "far",
    "sideleft",
    "sideright",
    "bastionprod",
    "bastionstaging",
    "studywin",
    "new"
  ]
}

node.default['station']['firefox-markdown'] = {
  "dir": ".local/share/mime/packages",
  "filename": "text-markdown.xml"
}


node.default['station']['other_groups'] = {
  "plex": {
    "gid": 1200,
    "members": [ "maxwell" ]
  },
  "xcode": {
    "gid": 1300,
    "members": [ ]
  }
}

node.default['station']['etc_config'] = [
  "nas.conf",
  "vital-backup.conf"
]

node.default['station']['usr_local'] = {
  "cookbook_scripts": {
    "bin": [
      "hot-tub-timemachine"
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
        "filename": "v1.1.0.tar.gz",
        "version": "1.1.0",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/bin/coding"
      },
      "position": {
        "source": "https://github.com/maxwax/position/archive",
        "filename": "v1.2.1.tar.gz",
        "version": "1.2.1",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/bin/position"
      },
      "open-tunnel": {
        "source": "https://github.com/maxwax/open-tunnel/archive",
        "filename": "v0.2.tar.gz",
        "version": "0.2",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/bin/open-tunnel"
      }
    },
    "sbin": {
      "nas": {
        "source": "https://github.com/maxwax/nas/archive",
        "filename": "v1.2.0.tar.gz",
        "version": "1.2.0",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/sbin/nas"
      },
      "safe": {
        "source": "https://github.com/maxwax/safe/archive",
        "filename": "v2.0.1.tar.gz",
        "version": "2.0.1",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/sbin/safe"
      },
      "santoku": {
        "source": "https://github.com/maxwax/santoku/archive",
        "filename": "v1.1.0.tar.gz",
        "version": "1.1.0",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/bin/santoku"
      },
      "smartcap": {
        "source": "https://github.com/maxwax/smartcap/archive",
        "filename": "v1.0.4.tar.gz",
        "version": "1.0.4",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/sbin/smartcap"
      },
      "vital-backup": {
        "source": "https://github.com/maxwax/vital-backup/archive",
        "filename": "v1.2.0.tar.gz",
        "version": "1.2.0",
        "file_type": "tgz",
        "install_script": "install.sh",
        "condition_file": "/usr/local/sbin/vital-backup"
      }
    }
  }
}

node.default['station']['typefaces'] = {
  "tarfiles": [
    "my-adobe",
    "microsoft-tt-core",
    "maxwell-fonts-atari",
    "sfpro"
  ]
}

node.default['station']['mount_points'] = {
  "/net": [
    "audiovideo",
    "auxdata",
    "avarchive",
    "centraldata",
    "filerdata",
    "mediadata",
    "offsite4tb-aux",
    "offsite4tb-filer",
    "teraxfiles",
    "tv320"
  ],
  "/mnt": [
    "usb",
    "secure"
  ]
}

node.default['station']['virtualbox'] = {
  "version": "6.1",
  "package_name": "VirtualBox",
  "repo_source": "https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo",
  "source": "https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo",
  "signing_key_source": "https://www.virtualbox.org/download/oracle_vbox.asc",
  "signing_key_fname": "oracle_vbox.asc"
}

node.default['station']['skype'] = {
  "repo_filename": "skype-stable.repo",
  "repo_source": "https://repo.skype.com/rpm/stable"
}

node.default['station']['atom'] = {
  "package_name": "atom"
}

node.default['station']['zoom'] = {
  "package_name": "zoom_x86_64.rpm",
  "rpm_source": "https://zoom.us/client/latest"
}

node.default['station']['aws_cli'] = {
  "package_name": "awscli-exe-linux-x86_64.zip",
  "rpm_source": "https://awscli.amazonaws.com"
}

plat_vers = "#{node['platform']}_#{node['platform_version']}"

case plat_vers
  when 'fedora_33'
    # List of repositories that should be installed by
    # downloading and installing packages
    node.default['station']['repo_packages'] = {
      "rpmfusion": {
        "free": {
          "pkg_name": "rpmfusion-free-release",
          "path": "rpmfusion-free-release-33.noarch.rpm",
          "source": "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-33.noarch.rpm"
        },
        "nonfree": {
          "pkg_name": "rpmfusion-nonfree-release",
          "path": "rpmfusion-nonfree-release-33.noarch.rpm",
          "source": "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-33.noarch.rpm"
        }
      }
    }

    # List of default packages to be installed for this Platform+Version
    node.default['station']['install_packages'] = {
      "bpytop": "Modern system performance monitor",
      "python3-spyder": "Python IDE",
      "bpytop": "An enhanced top command, very modern.",
      "ddrescue": "dd command that can read damaged media and recover data",
      "atop": "Better version of top",
      "wavemon": "WIFI Signal Monitor",
      "xsane": "Scanner utility",
      "xsane-gimp": "Scanner frontend for GIMP",
      "simple-scan": "Simple scanner utility",
      "shutter": "Shutter screen capture",
      "gthumb": "Image Viewer",
      "smem": "CLI memory utility for reporting per memory stats",
      "darkplaces-quake": "Classic first person shooter, I play once a year",
      "thunar": "Tree based file manager",
      "binutils": "for VirtualBox-6.1 kernel modules",
      "gcc": "for VirtualBox-6.1 kernel modules",
      "make": "for VirtualBox-6.1 kernel modules",
      "libgomp": "for VirtualBox-6.1 kernel modules",
      "glibc-headers": "for VirtualBox-6.1 kernel modules",
      "glibc-devel": "for VirtualBox-6.1 kernel modules",
      "kernel-headers": "for VirtualBox-6.1 kernel modules",
      "kernel-devel": "for VirtualBox-6.1 kernel modules",
      "qt5-qtx11extras": "for VirtualBox-6.1 kernel modules",
      "libxkbcommon": "for VirtualBox-6.1 kernel modules",
      "mediawriter": "Fedora Media Writer for creating USB boot drives",
      "livecd-iso-to-mediums": "Scripts for creating custom USB boot drives",
      "amule": "File sharing client compatible with eDonkey (rpmfusion-free)",
      "atari++": "Unix based emulator of the Atari eight bit computers (fedora)",
      "autodownloader": "GUI-tool to automate the download of certain files (updates)",
      "banshee": "Easily import, manage, and play selections from your music collection (fedora)",
      "calibre": "E-book converter and library manager (updates)",
      "catdoc": "A program which converts Microsoft office files to plain text (fedora)",
      "cdi-api": "CDI API (updates-modular)",
      "darktable": "Utility to organize and develop raw images (updates)",
      "dkms": "Dynamic Kernel Module Support Framework (fedora)",
      "easytag": "Tag editor for MP3, Ogg, FLAC and other music files (fedora)",
      "ebook-tools-libs": "Libraries for ebook-tools (fedora)",
      "ed": "The GNU line editor (fedora)",
      "evolution": "Mail and calendar client for GNOME (updates)",
      "evolution-help": "Help files for evolution (updates)",
      "evolution-langpacks": "Translations for evolution (updates)",
      "exfat-utils": "Utilities for exFAT file system (rpmfusion-free)",
      "expat": "An XML parser library (anaconda)",
      "expect": "A program-script interaction and testing utility (fedora)",
      "f29-backgrounds-base": "Base images for Fedora 29 default background (fedora)",
      "f29-backgrounds-gnome": "Fedora 29 default wallpaper for Gnome and Cinnamon (fedora)",
      "f30-backgrounds-base": "Base images for Fedora 30 default background (fedora)",
      "f30-backgrounds-gnome": "Fedora 30 default wallpaper for Gnome and Cinnamon (fedora)",
      "f33-backgrounds-base": "Base images for Fedora 33 default background (updates)",
      "f33-backgrounds-gnome": "Fedora 33 default wallpaper for Gnome and Cinnamon (updates)",
      "faac": "Encoder and encoding library for MPEG2/4 AAC (rpmfusion-nonfree)",
      "faad2-libs": "Shared libraries of the FAAD 2 AAC decoder (rpmfusion-free)",
      "ffmpeg": "Digital VCR and streaming server (rpmfusion-free-updates)",
      "ffmpeg-libs": "Libraries for ffmpeg (rpmfusion-free-updates)",
      "fio": "Multithreaded IO generation tool (fedora)",
      "firewall-config": "Firewall configuration application (fedora)",
      "freeipmi": "IPMI remote console and system management software (fedora)",
      "freetype": "A free and portable font rendering engine (anaconda)",
      "fuse3": "File System in Userspace (FUSE) v3 utilities (anaconda)",
      "fuse3-libs": "File System in Userspace (FUSE) v3 libraries (anaconda)",
      "fuse-exfat": "Free exFAT file system implementation (rpmfusion-free)",
      "fuse-overlayfs": "FUSE overlay+shiftfs implementation for rootless containers (updates)",
      "gcolor2": "A simple color selector for GTK+2 (fedora)",
      "gdbm-devel": "Development libraries and header files for the gdbm library (fedora)",
      "gftp": "A multi-threaded FTP client for the X Window System (fedora)",
      "gimp": "GNU Image Manipulation Program (updates-modular)",
      "gimp-data-extras": "Extra files for GIMP (fedora)",
      "gimp-libs": "GIMP libraries (updates-modular)",
      "gitg": "GTK+ graphical interface for the git revision control system (fedora)",
      "gitg-libs": "Backend Library for gitg (fedora)",
      "gnupg2": "Utility for secure communication and data storage (updates)",
      "gnome-shell-extension-freon": "GNOME Shell extension to display system temperature, voltage, and fan speed (fedora)",
      "gnome-shell-extension-openweather": "Display weather information from many locations in the world (fedora)",
      "gnome-shell-extension-launch-new-instance": "Always launch a new application instance for GNOME Shell (updates)",
      "golang": "The Go Programming Language (updates)",
      "golang-bin": "Golang core compiler tools (updates)",
      "golang-src": "Golang compiler source tree (updates)",
      "gparted": "Gnome Partition Editor (fedora)",
      "GraphicsMagick": "An ImageMagick fork, offering faster image generation and better quality (fedora)",
      "grip": "Front-end for CD rippers and Ogg Vorbis encoders (updates)",
      "grubby": "Command line tool for updating bootloader configs (fedora)",
      "gstreamer1": "GStreamer streaming media framework runtime (anaconda)",
      "gstreamer1-libav": "GStreamer 1.0 libav-based plug-ins (rpmfusion-free)",
      "gstreamer1-plugins-bad-freeworld": "GStreamer 1.0 streaming media framework 'bad' plug-ins (rpmfusion-free)",
      "gstreamer1-plugins-base": "GStreamer streaming media framework base plugins (anaconda)",
      "gstreamer1-plugins-base-tools": "Tools for GStreamer streaming media framework base plugins (fedora)",
      "gstreamer1-plugins-good-extras": "Extra GStreamer plugins with good code and licensing (fedora)",
      "gstreamer1-plugins-ugly": "GStreamer 1.0 streaming media framework 'ugly' plug-ins (rpmfusion-free)",
      "gstreamer-ffmpeg": "GStreamer FFmpeg-based plug-ins (rpmfusion-free-updates)",
      "gtkimageview": "Simple image viewer widget (fedora)",
      "hddtemp": "Hard disk temperature tool (fedora)",
      "hdparm": "A utility for displaying and/or setting hard disk parameters (fedora)",
      "hfsutils": "Tools for reading and writing Macintosh HFS volumes (fedora)",
      "ImageMagick": "An X application for displaying and manipulating images (updates)",
      "info": "A stand-alone TTY-based reader for GNU texinfo documentation (fedora)",
      "ipmitool": "Utility for IPMI control (fedora)",
      "iptraf-ng": "A console-based network monitoring utility (fedora)",
      "jnettop": "Network traffic tracker (fedora)",
      "jq": "Command-line JSON processor (fedora)",
      "kde-cli-tools": "Tools based on KDE Frameworks 5 to better interact with the system (updates)",
      "kdenlive": "Non-linear video editor (rpmfusion-free-updates)",
      "keepassx": "Cross-platform password manager (fedora)",
      "lame": "Free MP3 audio compressor (fedora)",
      "liberation-fonts": "Fonts to replace commonly used Microsoft Windows fonts (fedora)",
      "lftp": "A sophisticated file transfer program (fedora)",
      "lm_sensors": "Hardware monitoring tools (fedora)",
      "lsscsi": "List SCSI devices (or hosts) and associated information (fedora)",
      "meld": "Visual diff and merge tool (fedora)",
      "mencoder": "MPlayer movie encoder (rpmfusion-free)",
      "minicom": "A text-based modem control and terminal emulation program (fedora)",
      "minizip": "Minizip contrib in zlib with the latest bug fixes and advanced features (updates)",
      "moby-engine": "The open-source application container engine (fedora)",
      "moby-engine-vim": "Vim syntax highlighting files for moby-engine (fedora)",
      "mp3splt": "A Free, command-line, AlbumWrap and mp3wrap file exctractor (rpmfusion-free)",
      "mplayer": "Movie player playing most video formats and DVDs (rpmfusion-free)",
      "mplayer-common": "MPlayer common files (rpmfusion-free)",
      "mplayer-gui": "GUI for MPlayer (rpmfusion-free)",
      "mtr-gtk": "GTK+ interface for MTR (fedora)",
      "nmap": "Network exploration tool and security scanner (fedora)",
      "pass": "A password manager using standard Unix tools (fedora)",
      "patch": "Utility for modifying/upgrading files (fedora)",
      "pidgin": "A Gtk+ based multiprotocol instant messaging client (fedora)",
      "pidgin-libnotify": "Libnotify Pidgin plugin (fedora)",
      "pidgin-logviewer": "User-friendly and intuitive chat log viewer for Pidgin (fedora)",
      "pidgin-otr": "Off-The-Record Messaging plugin for Pidgin (fedora)",
      "pidgin-sipe": "Pidgin protocol plugin to connect to MS Office Communicator (updates)",
      "pitivi": "Non-linear video editor (fedora)",
      "podman": "Manage Pods, Containers and Container Images (anaconda)",
      "podman-compose": "Docker Copose replacement (anaconda)",
      "powerline": "The ultimate status-line/prompt utility (fedora)",
      "powerline-fonts": "Powerline Fonts (fedora)",
      "powertop": "Power consumption monitor (updates)",
      "proxychains-ng": "Redirect connections through proxy servers (fedora)",
      "purple-sipe": "Libpurple protocol plugin to connect to MS Office Communicator (updates)",
      "pv": "A tool for monitoring the progress of data through a pipeline (fedora)",
      "remmina": "Remote Desktop Client (fedora)",
      "remmina-plugins-exec": "External execution plugin for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-nx": "NX plugin for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-rdp": "RDP plugin for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-secret": "Keyring integration for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-st": "Simple Terminal plugin for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-vnc": "VNC plugin for Remmina Remote Desktop Client (fedora)",
      "remmina-plugins-xdmcp": "XDMCP plugin for Remmina Remote Desktop Client (fedora)",
      "ruby-devel": "A Ruby development environment (updates)",
      "samba": "Server and Client software to interoperate with Windows machines (updates)",
      "samba-common-tools": "Tools for Samba servers and clients (updates)",
      "screenfetch": "A 'Bash Screenshot Information Tool' (fedora)",
      "seahorse": "A GNOME application for managing encryption keys (fedora)",
      "sen": "Terminal User Interface for docker engine (fedora)",
      "signon": "Accounts framework for Linux and POSIX based platforms (fedora)",
      "signon-plugin-oauth2": "OAuth2 plugin for the Accounts framework (fedora)",
      "smartmontools": "Tools for monitoring SMART capable hard disks (fedora)",
      "smplayer": "A graphical frontend for mplayer and mpv (rpmfusion-free-updates)",
      "sox": "A general purpose sound file conversion tool (fedora)",
      "strace": "Tracks and displays system calls associated with a running process (fedora)",
      "sysstat": "Collection of performance monitoring tools for Linux (fedora)",
      "telepathy-glib": "GLib bindings for Telepathy (fedora)",
      "terminator": "Store and run multiple GNOME terminals in one window (fedora)",
      "tigervnc-server": "A TigerVNC server (updates)",
      "thunderbird": "Mozilla Thunderbird mail/newsgroup client (updates)",
      "ufraw-common": "Common files needed by UFRaw (fedora)",
      "ufraw-gimp": "GIMP plugin to retrieve raw image data from digital cameras (fedora)",
      "unetbootin": "Create bootable Live USB drives for a variety of Linux distributions (fedora)",
      "unrar": "Utility for extracting, testing and viewing RAR archives (rpmfusion-nonfree-updates)",
      "usbview": "USB topology and device viewer (fedora)",
      "vagrant": "Build and distribute virtualized development environments (updates)",
      "video-downloader": "Download videos from websites like YouTube and many others (fedora)",
      "vim-go": "Go development plugin for Vim (fedora)",
      "vim-powerline": "Powerline VIM plugin (fedora)",
      "vim-X11": "The VIM version of the vi editor for the X Window System - GVim (updates)",
      "virt-manager": "Desktop tool for managing virtual machines via libvirt (fedora)",
      "virt-manager-common": "Common files used by the different Virtual Machine Manager interfaces (fedora)",
      "virt-top": "Utility like top(1) for displaying virtualization stats (fedora)",
      "virt-viewer": "Virtual Machine Viewer (fedora)",
      "virt-what": "Detect if we are running in a virtual machine (fedora)",
      "vlc": "The cross-platform open-source multimedia framework, player and server (rpmfusion-free-updates)",
      "vlc-core": "VLC media player core (rpmfusion-free-updates)",
      "wireshark": "Network traffic analyzer (updates)",
      "wireshark-cli": "Network traffic analyzer (updates)",
      "wmctrl": "Command line tool to interact with an X Window Manager (fedora)",
      "wodim": "A command line CD/DVD recording program (fedora)"
    }

# This isn't working for unknown reasons 2019-12-18
# Could be a Fedora | DNF issue, so test elsewhere first
      # # List of default packages to be installed for this Platform+Version
      # node.default['station']['install_packages_versions'] = [
      #     "wmctrl": "1.07-27.fc31"
      # ]

    # List of packages to be removed for this Package+Version
    node.default['station']['remove_packages'] = [
        "khmeros-base-fonts",
        "khmeros-fonts-common",
        "jomolhari-fonts",
        "lohit-assamese-fonts",
        "lohit-bengali-fonts",
        "lohit-devanagari-fonts",
        "lohit-gujarati-fonts",
        "lohit-kannada-fonts",
        "lohit-odia-fonts",
        "lohit-tamil-fonts",
        "lohit-telugu-fonts",
        "paktype-naskh-basic-fonts",
        "thai-scalable-fonts-common",
        "thai-scalable-waree-fonts",
        "aajohan-comfortaa-fonts",
        "gdouros-symobola-fonts"
      ]

    when 'fedora_34'
      # List of repositories that should be installed by
      # downloading and installing packages
      node.default['station']['repo_packages'] = {
        "rpmfusion": {
          "free": {
            "pkg_name": "rpmfusion-free-release",
            "path": "rpmfusion-free-release-34.noarch.rpm",
            "source": "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-34.noarch.rpm"
          },
          "nonfree": {
            "pkg_name": "rpmfusion-nonfree-release",
            "path": "rpmfusion-nonfree-release-34.noarch.rpm",
            "source": "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-34.noarch.rpm"
          }
        }
      }

      # List of default packages to be installed for this Platform+Version
      node.default['station']['install_packages'] = {
        "bpytop": "An enhanced top command, very modern.",
        "ddrescue": "dd command that can read damaged media and recover data",
        "atop": "Better version of top",
        "wavemon": "WIFI Signal Monitor",
        "xsane": "Scanner utility",
        "xsane-gimp": "Scanner frontend for GIMP",
        "simple-scan": "Simple scanner utility",
        "shutter": "Shutter screen capture",
        "gthumb": "Image Viewer",
        "smem": "CLI memory utility for reporting per memory stats",
        "darkplaces-quake": "Classic first person shooter, I play once a year",
        "thunar": "Tree based file manager",
        "binutils": "for VirtualBox-6.1 kernel modules",
        "gcc": "for VirtualBox-6.1 kernel modules",
        "make": "for VirtualBox-6.1 kernel modules",
        "libgomp": "for VirtualBox-6.1 kernel modules",
        "glibc-headers": "for VirtualBox-6.1 kernel modules",
        "glibc-devel": "for VirtualBox-6.1 kernel modules",
        "kernel-headers": "for VirtualBox-6.1 kernel modules",
        "kernel-devel": "for VirtualBox-6.1 kernel modules",
        "qt5-qtx11extras": "for VirtualBox-6.1 kernel modules",
        "libxkbcommon": "for VirtualBox-6.1 kernel modules",
        "mediawriter": "Fedora Media Writer for creating USB boot drives",
        "livecd-iso-to-mediums": "Scripts for creating custom USB boot drives",
        "amule": "File sharing client compatible with eDonkey (rpmfusion-free)",
        "atari++": "Unix based emulator of the Atari eight bit computers (fedora)",
        "autodownloader": "GUI-tool to automate the download of certain files (updates)",
        "calibre": "E-book converter and library manager (updates)",
        "catdoc": "A program which converts Microsoft office files to plain text (fedora)",
        "cdi-api": "CDI API (updates-modular)",
        "darktable": "Utility to organize and develop raw images (updates)",
        "dkms": "Dynamic Kernel Module Support Framework (fedora)",
        "easytag": "Tag editor for MP3, Ogg, FLAC and other music files (fedora)",
        "ebook-tools-libs": "Libraries for ebook-tools (fedora)",
        "ed": "The GNU line editor (fedora)",
        "evolution": "Mail and calendar client for GNOME (updates)",
        "evolution-help": "Help files for evolution (updates)",
        "evolution-langpacks": "Translations for evolution (updates)",
        "exfat-utils": "Utilities for exFAT file system (rpmfusion-free)",
        "expat": "An XML parser library (anaconda)",
        "expect": "A program-script interaction and testing utility (fedora)",
        "f29-backgrounds-base": "Base images for Fedora 29 default background (fedora)",
        "f29-backgrounds-gnome": "Fedora 29 default wallpaper for Gnome and Cinnamon (fedora)",
        "f30-backgrounds-base": "Base images for Fedora 30 default background (fedora)",
        "f30-backgrounds-gnome": "Fedora 30 default wallpaper for Gnome and Cinnamon (fedora)",
        "f33-backgrounds-base": "Base images for Fedora 33 default background (updates)",
        "f33-backgrounds-gnome": "Fedora 33 default wallpaper for Gnome and Cinnamon (updates)",
        "f34-backgrounds-base": "Base images for Fedora 33 default background (updates)",
        "f34-backgrounds-gnome": "Fedora 33 default wallpaper for Gnome and Cinnamon (updates)",
        "faac": "Encoder and encoding library for MPEG2/4 AAC (rpmfusion-nonfree)",
        "faad2-libs": "Shared libraries of the FAAD 2 AAC decoder (rpmfusion-free)",
        "ffmpeg": "Digital VCR and streaming server (rpmfusion-free-updates)",
        "ffmpeg-libs": "Libraries for ffmpeg (rpmfusion-free-updates)",
        "fio": "Multithreaded IO generation tool (fedora)",
        "firewall-config": "Firewall configuration application (fedora)",
        "freeipmi": "IPMI remote console and system management software (fedora)",
        "freetype": "A free and portable font rendering engine (anaconda)",
        "fuse3": "File System in Userspace (FUSE) v3 utilities (anaconda)",
        "fuse3-libs": "File System in Userspace (FUSE) v3 libraries (anaconda)",
        "fuse-exfat": "Free exFAT file system implementation (rpmfusion-free)",
        "fuse-overlayfs": "FUSE overlay+shiftfs implementation for rootless containers (updates)",
        "gcolor2": "A simple color selector for GTK+2 (fedora)",
        "gdbm-devel": "Development libraries and header files for the gdbm library (fedora)",
        "gftp": "A multi-threaded FTP client for the X Window System (fedora)",
        "gimp": "GNU Image Manipulation Program (updates-modular)",
        "gimp-data-extras": "Extra files for GIMP (fedora)",
        "gimp-libs": "GIMP libraries (updates-modular)",
        "gitg": "GTK+ graphical interface for the git revision control system (fedora)",
        "gitg-libs": "Backend Library for gitg (fedora)",
        "gnupg2": "Utility for secure communication and data storage (updates)",
        "gnome-shell-extension-freon": "GNOME Shell extension to display system temperature, voltage, and fan speed (fedora)",
        "gnome-shell-extension-openweather": "Display weather information from many locations in the world (fedora)",
        "gnome-shell-extension-launch-new-instance": "Always launch a new application instance for GNOME Shell (updates)",
        "golang": "The Go Programming Language (updates)",
        "golang-bin": "Golang core compiler tools (updates)",
        "golang-src": "Golang compiler source tree (updates)",
        "gparted": "Gnome Partition Editor (fedora)",
        "GraphicsMagick": "An ImageMagick fork, offering faster image generation and better quality (fedora)",
        "grip": "Front-end for CD rippers and Ogg Vorbis encoders (updates)",
        "grubby": "Command line tool for updating bootloader configs (fedora)",
        "gstreamer1": "GStreamer streaming media framework runtime (anaconda)",
        "gstreamer1-libav": "GStreamer 1.0 libav-based plug-ins (rpmfusion-free)",
        "gstreamer1-plugins-bad-freeworld": "GStreamer 1.0 streaming media framework 'bad' plug-ins (rpmfusion-free)",
        "gstreamer1-plugins-base": "GStreamer streaming media framework base plugins (anaconda)",
        "gstreamer1-plugins-base-tools": "Tools for GStreamer streaming media framework base plugins (fedora)",
        "gstreamer1-plugins-good-extras": "Extra GStreamer plugins with good code and licensing (fedora)",
        "gstreamer1-plugins-ugly": "GStreamer 1.0 streaming media framework 'ugly' plug-ins (rpmfusion-free)",
        "gstreamer-ffmpeg": "GStreamer FFmpeg-based plug-ins (rpmfusion-free-updates)",
        "gtkimageview": "Simple image viewer widget (fedora)",
        "hddtemp": "Hard disk temperature tool (fedora)",
        "hdparm": "A utility for displaying and/or setting hard disk parameters (fedora)",
        "hfsutils": "Tools for reading and writing Macintosh HFS volumes (fedora)",
        "ImageMagick": "An X application for displaying and manipulating images (updates)",
        "info": "A stand-alone TTY-based reader for GNU texinfo documentation (fedora)",
        "ipmitool": "Utility for IPMI control (fedora)",
        "iptraf-ng": "A console-based network monitoring utility (fedora)",
        "jq": "Command-line JSON processor (fedora)",
        "kde-cli-tools": "Tools based on KDE Frameworks 5 to better interact with the system (updates)",
        "kdenlive": "Non-linear video editor (rpmfusion-free-updates)",
        "keepassx": "Cross-platform password manager (fedora)",
        "lame": "Free MP3 audio compressor (fedora)",
        "liberation-fonts": "Fonts to replace commonly used Microsoft Windows fonts (fedora)",
        "lftp": "A sophisticated file transfer program (fedora)",
        "lm_sensors": "Hardware monitoring tools (fedora)",
        "lsscsi": "List SCSI devices (or hosts) and associated information (fedora)",
        "meld": "Visual diff and merge tool (fedora)",
        "mencoder": "MPlayer movie encoder (rpmfusion-free)",
        "minicom": "A text-based modem control and terminal emulation program (fedora)",
        "minizip": "Minizip contrib in zlib with the latest bug fixes and advanced features (updates)",
        "mp3splt": "A Free, command-line, AlbumWrap and mp3wrap file exctractor (rpmfusion-free)",
        "mplayer": "Movie player playing most video formats and DVDs (rpmfusion-free)",
        "mplayer-common": "MPlayer common files (rpmfusion-free)",
        "mplayer-gui": "GUI for MPlayer (rpmfusion-free)",
        "mtr-gtk": "GTK+ interface for MTR (fedora)",
        "nmap": "Network exploration tool and security scanner (fedora)",
        "pass": "A password manager using standard Unix tools (fedora)",
        "patch": "Utility for modifying/upgrading files (fedora)",
        "pidgin": "A Gtk+ based multiprotocol instant messaging client (fedora)",
        "pidgin-libnotify": "Libnotify Pidgin plugin (fedora)",
        "pidgin-logviewer": "User-friendly and intuitive chat log viewer for Pidgin (fedora)",
        "pidgin-otr": "Off-The-Record Messaging plugin for Pidgin (fedora)",
        "pidgin-sipe": "Pidgin protocol plugin to connect to MS Office Communicator (updates)",
        "pitivi": "Non-linear video editor (fedora)",
        "podman": "Manage Pods, Containers and Container Images (anaconda)",
        "podman-compose": "Docker Copose replacement (anaconda)",
        "powerline": "The ultimate status-line/prompt utility (fedora)",
        "powerline-fonts": "Powerline Fonts (fedora)",
        "powertop": "Power consumption monitor (updates)",
        "proxychains-ng": "Redirect connections through proxy servers (fedora)",
        "purple-sipe": "Libpurple protocol plugin to connect to MS Office Communicator (updates)",
        "pv": "A tool for monitoring the progress of data through a pipeline (fedora)",
        "remmina": "Remote Desktop Client (fedora)",
        "remmina-plugins-exec": "External execution plugin for Remmina Remote Desktop Client (fedora)",
        "remmina-plugins-rdp": "RDP plugin for Remmina Remote Desktop Client (fedora)",
        "remmina-plugins-secret": "Keyring integration for Remmina Remote Desktop Client (fedora)",
        "remmina-plugins-vnc": "VNC plugin for Remmina Remote Desktop Client (fedora)",
        "ruby-devel": "A Ruby development environment (updates)",
        "samba": "Server and Client software to interoperate with Windows machines (updates)",
        "samba-common-tools": "Tools for Samba servers and clients (updates)",
        "screenfetch": "A 'Bash Screenshot Information Tool' (fedora)",
        "seahorse": "A GNOME application for managing encryption keys (fedora)",
        "sen": "Terminal User Interface for docker engine (fedora)",
        "signon": "Accounts framework for Linux and POSIX based platforms (fedora)",
        "signon-plugin-oauth2": "OAuth2 plugin for the Accounts framework (fedora)",
        "smartmontools": "Tools for monitoring SMART capable hard disks (fedora)",
        "smplayer": "A graphical frontend for mplayer and mpv (rpmfusion-free-updates)",
        "sox": "A general purpose sound file conversion tool (fedora)",
        "strace": "Tracks and displays system calls associated with a running process (fedora)",
        "sysstat": "Collection of performance monitoring tools for Linux (fedora)",
        "telepathy-glib": "GLib bindings for Telepathy (fedora)",
        "terminator": "Store and run multiple GNOME terminals in one window (fedora)",
        "tigervnc-server": "A TigerVNC server (updates)",
        "thunderbird": "Mozilla Thunderbird mail/newsgroup client (updates)",
        "ufraw-common": "Common files needed by UFRaw (fedora)",
        "ufraw-gimp": "GIMP plugin to retrieve raw image data from digital cameras (fedora)",
        "unetbootin": "Create bootable Live USB drives for a variety of Linux distributions (fedora)",
        "unrar": "Utility for extracting, testing and viewing RAR archives (rpmfusion-nonfree-updates)",
        "usbview": "USB topology and device viewer (fedora)",
        "vagrant": "Build and distribute virtualized development environments (updates)",
        "video-downloader": "Download videos from websites like YouTube and many others (fedora)",
        "vim-go": "Go development plugin for Vim (fedora)",
        "vim-powerline": "Powerline VIM plugin (fedora)",
        "vim-X11": "The VIM version of the vi editor for the X Window System - GVim (updates)",
        "virt-manager": "Desktop tool for managing virtual machines via libvirt (fedora)",
        "virt-manager-common": "Common files used by the different Virtual Machine Manager interfaces (fedora)",
        "virt-top": "Utility like top(1) for displaying virtualization stats (fedora)",
        "virt-viewer": "Virtual Machine Viewer (fedora)",
        "virt-what": "Detect if we are running in a virtual machine (fedora)",
        "vlc": "The cross-platform open-source multimedia framework, player and server (rpmfusion-free-updates)",
        "vlc-core": "VLC media player core (rpmfusion-free-updates)",
        "wireshark": "Network traffic analyzer (updates)",
        "wireshark-cli": "Network traffic analyzer (updates)",
        "wmctrl": "Command line tool to interact with an X Window Manager (fedora)",
        "wodim": "A command line CD/DVD recording program (fedora)"
      }

    # This isn't working for unknown reasons 2019-12-18
    # Could be a Fedora | DNF issue, so test elsewhere first
        # # List of default packages to be installed for this Platform+Version
        # node.default['station']['install_packages_versions'] = [
        #     "wmctrl": "1.07-27.fc31"
        # ]

      # List of packages to be removed for this Package+Version
      node.default['station']['remove_packages'] = [
          "khmeros-base-fonts",
          "khmeros-fonts-common",
          "jomolhari-fonts",
          "lohit-assamese-fonts",
          "lohit-bengali-fonts",
          "lohit-devanagari-fonts",
          "lohit-gujarati-fonts",
          "lohit-kannada-fonts",
          "lohit-odia-fonts",
          "lohit-tamil-fonts",
          "lohit-telugu-fonts",
          "paktype-naskh-basic-fonts",
          "thai-scalable-fonts-common",
          "thai-scalable-waree-fonts",
          "aajohan-comfortaa-fonts",
          "gdouros-symobola-fonts"
        ]

      when 'fedora_35'
        # List of repositories that should be installed by
        # downloading and installing packages
        node.default['station']['repo_packages'] = {
          "rpmfusion": {
            "free": {
              "pkg_name": "rpmfusion-free-release",
              "path": "rpmfusion-free-release-35.noarch.rpm",
              "source": "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-35.noarch.rpm"
            },
            "nonfree": {
              "pkg_name": "rpmfusion-nonfree-release",
              "path": "rpmfusion-nonfree-release-35.noarch.rpm",
              "source": "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-35.noarch.rpm"
            }
          }
        }

        # List of default packages to be installed for this Platform+Version
        node.default['station']['install_packages'] = {
          "bpytop": "An enhanced top command, very modern.",
          "ddrescue": "dd command that can read damaged media and recover data",
          "atop": "Better version of top",
          "wavemon": "WIFI Signal Monitor",
          "xsane": "Scanner utility",
          "xsane-gimp": "Scanner frontend for GIMP",
          "simple-scan": "Simple scanner utility",
          "shutter": "Shutter screen capture",
          "gthumb": "Image Viewer",
          "smem": "CLI memory utility for reporting per memory stats",
          "darkplaces-quake": "Classic first person shooter, I play once a year",
          "thunar": "Tree based file manager",
          "binutils": "for VirtualBox-6.1 kernel modules",
          "gcc": "for VirtualBox-6.1 kernel modules",
          "make": "for VirtualBox-6.1 kernel modules",
          "libgomp": "for VirtualBox-6.1 kernel modules",
          "glibc-headers": "for VirtualBox-6.1 kernel modules",
          "glibc-devel": "for VirtualBox-6.1 kernel modules",
          "kernel-headers": "for VirtualBox-6.1 kernel modules",
          "kernel-devel": "for VirtualBox-6.1 kernel modules",
          "qt5-qtx11extras": "for VirtualBox-6.1 kernel modules",
          "libxkbcommon": "for VirtualBox-6.1 kernel modules",
          "mediawriter": "Fedora Media Writer for creating USB boot drives",
          "livecd-iso-to-mediums": "Scripts for creating custom USB boot drives",
          "amule": "File sharing client compatible with eDonkey (rpmfusion-free)",
          "atari++": "Unix based emulator of the Atari eight bit computers (fedora)",
          "autodownloader": "GUI-tool to automate the download of certain files (updates)",
          "calibre": "E-book converter and library manager (updates)",
          "catdoc": "A program which converts Microsoft office files to plain text (fedora)",
          "cdi-api": "CDI API (updates-modular)",
          "darktable": "Utility to organize and develop raw images (updates)",
          "dkms": "Dynamic Kernel Module Support Framework (fedora)",
          "easytag": "Tag editor for MP3, Ogg, FLAC and other music files (fedora)",
          "ebook-tools-libs": "Libraries for ebook-tools (fedora)",
          "ed": "The GNU line editor (fedora)",
          "evolution": "Mail and calendar client for GNOME (updates)",
          "evolution-help": "Help files for evolution (updates)",
          "evolution-langpacks": "Translations for evolution (updates)",
          "exfat-utils": "Utilities for exFAT file system (rpmfusion-free)",
          "expat": "An XML parser library (anaconda)",
          "expect": "A program-script interaction and testing utility (fedora)",
          "f29-backgrounds-base": "Base images for Fedora 29 default background (fedora)",
          "f29-backgrounds-gnome": "Fedora 29 default wallpaper for Gnome and Cinnamon (fedora)",
          "f30-backgrounds-base": "Base images for Fedora 30 default background (fedora)",
          "f30-backgrounds-gnome": "Fedora 30 default wallpaper for Gnome and Cinnamon (fedora)",
          "f33-backgrounds-base": "Base images for Fedora 33 default background (updates)",
          "f33-backgrounds-gnome": "Fedora 33 default wallpaper for Gnome and Cinnamon (updates)",
          "f34-backgrounds-base": "Base images for Fedora 33 default background (updates)",
          "f34-backgrounds-gnome": "Fedora 33 default wallpaper for Gnome and Cinnamon (updates)",
          "faac": "Encoder and encoding library for MPEG2/4 AAC (rpmfusion-nonfree)",
          "faad2-libs": "Shared libraries of the FAAD 2 AAC decoder (rpmfusion-free)",
          "ffmpeg": "Digital VCR and streaming server (rpmfusion-free-updates)",
          "ffmpeg-libs": "Libraries for ffmpeg (rpmfusion-free-updates)",
          "fio": "Multithreaded IO generation tool (fedora)",
          "firewall-config": "Firewall configuration application (fedora)",
          "freeipmi": "IPMI remote console and system management software (fedora)",
          "freetype": "A free and portable font rendering engine (anaconda)",
          "fuse3": "File System in Userspace (FUSE) v3 utilities (anaconda)",
          "fuse3-libs": "File System in Userspace (FUSE) v3 libraries (anaconda)",
          "fuse-exfat": "Free exFAT file system implementation (rpmfusion-free)",
          "fuse-overlayfs": "FUSE overlay+shiftfs implementation for rootless containers (updates)",
          "gcolor2": "A simple color selector for GTK+2 (fedora)",
          "gdbm-devel": "Development libraries and header files for the gdbm library (fedora)",
          "gftp": "A multi-threaded FTP client for the X Window System (fedora)",
          "gimp": "GNU Image Manipulation Program (updates-modular)",
          "gimp-data-extras": "Extra files for GIMP (fedora)",
          "gimp-libs": "GIMP libraries (updates-modular)",
          "gitg": "GTK+ graphical interface for the git revision control system (fedora)",
          "gitg-libs": "Backend Library for gitg (fedora)",
          "gnupg2": "Utility for secure communication and data storage (updates)",
          "gnome-shell-extension-freon": "GNOME Shell extension to display system temperature, voltage, and fan speed (fedora)",
          "gnome-shell-extension-openweather": "Display weather information from many locations in the world (fedora)",
          "gnome-shell-extension-launch-new-instance": "Always launch a new application instance for GNOME Shell (updates)",
          "golang": "The Go Programming Language (updates)",
          "golang-bin": "Golang core compiler tools (updates)",
          "golang-src": "Golang compiler source tree (updates)",
          "gparted": "Gnome Partition Editor (fedora)",
          "GraphicsMagick": "An ImageMagick fork, offering faster image generation and better quality (fedora)",
          "grip": "Front-end for CD rippers and Ogg Vorbis encoders (updates)",
          "grubby": "Command line tool for updating bootloader configs (fedora)",
          "gstreamer1": "GStreamer streaming media framework runtime (anaconda)",
          "gstreamer1-libav": "GStreamer 1.0 libav-based plug-ins (rpmfusion-free)",
          "gstreamer1-plugins-bad-freeworld": "GStreamer 1.0 streaming media framework 'bad' plug-ins (rpmfusion-free)",
          "gstreamer1-plugins-base": "GStreamer streaming media framework base plugins (anaconda)",
          "gstreamer1-plugins-base-tools": "Tools for GStreamer streaming media framework base plugins (fedora)",
          "gstreamer1-plugins-good-extras": "Extra GStreamer plugins with good code and licensing (fedora)",
          "gstreamer1-plugins-ugly": "GStreamer 1.0 streaming media framework 'ugly' plug-ins (rpmfusion-free)",
          "gstreamer-ffmpeg": "GStreamer FFmpeg-based plug-ins (rpmfusion-free-updates)",
          "gtkimageview": "Simple image viewer widget (fedora)",
          "hddtemp": "Hard disk temperature tool (fedora)",
          "hdparm": "A utility for displaying and/or setting hard disk parameters (fedora)",
          "hfsutils": "Tools for reading and writing Macintosh HFS volumes (fedora)",
          "ImageMagick": "An X application for displaying and manipulating images (updates)",
          "info": "A stand-alone TTY-based reader for GNU texinfo documentation (fedora)",
          "ipmitool": "Utility for IPMI control (fedora)",
          "iptraf-ng": "A console-based network monitoring utility (fedora)",
          "jq": "Command-line JSON processor (fedora)",
          "kde-cli-tools": "Tools based on KDE Frameworks 5 to better interact with the system (updates)",
          "kdenlive": "Non-linear video editor (rpmfusion-free-updates)",
          "keepassx": "Cross-platform password manager (fedora)",
          "lame": "Free MP3 audio compressor (fedora)",
          "liberation-fonts": "Fonts to replace commonly used Microsoft Windows fonts (fedora)",
          "lftp": "A sophisticated file transfer program (fedora)",
          "lm_sensors": "Hardware monitoring tools (fedora)",
          "lsscsi": "List SCSI devices (or hosts) and associated information (fedora)",
          "meld": "Visual diff and merge tool (fedora)",
          "mencoder": "MPlayer movie encoder (rpmfusion-free)",
          "minicom": "A text-based modem control and terminal emulation program (fedora)",
          "minizip": "Minizip contrib in zlib with the latest bug fixes and advanced features (updates)",
          "mp3splt": "A Free, command-line, AlbumWrap and mp3wrap file exctractor (rpmfusion-free)",
          "mplayer": "Movie player playing most video formats and DVDs (rpmfusion-free)",
          "mplayer-common": "MPlayer common files (rpmfusion-free)",
          "mplayer-gui": "GUI for MPlayer (rpmfusion-free)",
          "mtr-gtk": "GTK+ interface for MTR (fedora)",
          "nmap": "Network exploration tool and security scanner (fedora)",
          "pass": "A password manager using standard Unix tools (fedora)",
          "patch": "Utility for modifying/upgrading files (fedora)",
          "pidgin": "A Gtk+ based multiprotocol instant messaging client (fedora)",
          "pidgin-libnotify": "Libnotify Pidgin plugin (fedora)",
          "pidgin-logviewer": "User-friendly and intuitive chat log viewer for Pidgin (fedora)",
          "pidgin-otr": "Off-The-Record Messaging plugin for Pidgin (fedora)",
          "pidgin-sipe": "Pidgin protocol plugin to connect to MS Office Communicator (updates)",
          "pitivi": "Non-linear video editor (fedora)",
          "podman": "Manage Pods, Containers and Container Images (anaconda)",
          "podman-compose": "Docker Copose replacement (anaconda)",
          "powerline": "The ultimate status-line/prompt utility (fedora)",
          "powerline-fonts": "Powerline Fonts (fedora)",
          "powertop": "Power consumption monitor (updates)",
          "proxychains-ng": "Redirect connections through proxy servers (fedora)",
          "purple-sipe": "Libpurple protocol plugin to connect to MS Office Communicator (updates)",
          "pv": "A tool for monitoring the progress of data through a pipeline (fedora)",
          "remmina": "Remote Desktop Client (fedora)",
          "remmina-plugins-exec": "External execution plugin for Remmina Remote Desktop Client (fedora)",
          "remmina-plugins-rdp": "RDP plugin for Remmina Remote Desktop Client (fedora)",
          "remmina-plugins-secret": "Keyring integration for Remmina Remote Desktop Client (fedora)",
          "remmina-plugins-vnc": "VNC plugin for Remmina Remote Desktop Client (fedora)",
          "ruby-devel": "A Ruby development environment (updates)",
          "samba": "Server and Client software to interoperate with Windows machines (updates)",
          "samba-common-tools": "Tools for Samba servers and clients (updates)",
          "screenfetch": "A 'Bash Screenshot Information Tool' (fedora)",
          "seahorse": "A GNOME application for managing encryption keys (fedora)",
          "sen": "Terminal User Interface for docker engine (fedora)",
          "signon": "Accounts framework for Linux and POSIX based platforms (fedora)",
          "signon-plugin-oauth2": "OAuth2 plugin for the Accounts framework (fedora)",
          "smartmontools": "Tools for monitoring SMART capable hard disks (fedora)",
          "smplayer": "A graphical frontend for mplayer and mpv (rpmfusion-free-updates)",
          "sox": "A general purpose sound file conversion tool (fedora)",
          "strace": "Tracks and displays system calls associated with a running process (fedora)",
          "sysstat": "Collection of performance monitoring tools for Linux (fedora)",
          "telepathy-glib": "GLib bindings for Telepathy (fedora)",
          "terminator": "Store and run multiple GNOME terminals in one window (fedora)",
          "tigervnc-server": "A TigerVNC server (updates)",
          "thunderbird": "Mozilla Thunderbird mail/newsgroup client (updates)",
          "ufraw-common": "Common files needed by UFRaw (fedora)",
          "ufraw-gimp": "GIMP plugin to retrieve raw image data from digital cameras (fedora)",
          "unetbootin": "Create bootable Live USB drives for a variety of Linux distributions (fedora)",
          "unrar": "Utility for extracting, testing and viewing RAR archives (rpmfusion-nonfree-updates)",
          "usbview": "USB topology and device viewer (fedora)",
          "vagrant": "Build and distribute virtualized development environments (updates)",
          "video-downloader": "Download videos from websites like YouTube and many others (fedora)",
          "vim-go": "Go development plugin for Vim (fedora)",
          "vim-powerline": "Powerline VIM plugin (fedora)",
          "vim-X11": "The VIM version of the vi editor for the X Window System - GVim (updates)",
          "virt-manager": "Desktop tool for managing virtual machines via libvirt (fedora)",
          "virt-manager-common": "Common files used by the different Virtual Machine Manager interfaces (fedora)",
          "virt-top": "Utility like top(1) for displaying virtualization stats (fedora)",
          "virt-viewer": "Virtual Machine Viewer (fedora)",
          "virt-what": "Detect if we are running in a virtual machine (fedora)",
          "vlc": "The cross-platform open-source multimedia framework, player and server (rpmfusion-free-updates)",
          "vlc-core": "VLC media player core (rpmfusion-free-updates)",
          "wireshark": "Network traffic analyzer (updates)",
          "wireshark-cli": "Network traffic analyzer (updates)",
          "wmctrl": "Command line tool to interact with an X Window Manager (fedora)",
          "wodim": "A command line CD/DVD recording program (fedora)"
        }

      # This isn't working for unknown reasons 2019-12-18
      # Could be a Fedora | DNF issue, so test elsewhere first
          # # List of default packages to be installed for this Platform+Version
          # node.default['station']['install_packages_versions'] = [
          #     "wmctrl": "1.07-27.fc31"
          # ]

        # List of packages to be removed for this Package+Version
        node.default['station']['remove_packages'] = [
            "khmeros-base-fonts",
            "khmeros-fonts-common",
            "jomolhari-fonts",
            "lohit-assamese-fonts",
            "lohit-bengali-fonts",
            "lohit-devanagari-fonts",
            "lohit-gujarati-fonts",
            "lohit-kannada-fonts",
            "lohit-odia-fonts",
            "lohit-tamil-fonts",
            "lohit-telugu-fonts",
            "paktype-naskh-basic-fonts",
            "thai-scalable-fonts-common",
            "thai-scalable-waree-fonts",
            "aajohan-comfortaa-fonts",
            "gdouros-symobola-fonts"
          ]


end
