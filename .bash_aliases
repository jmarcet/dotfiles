[[ "$OSTYPE" == darwin* ]] && _g=g

unalias grm

alias 7za="7za -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"
alias aria2c='aria2c -j 4 -x 4'
alias _bash-android="bash -rcfile ~/.bashrc-android"
alias beep="mpv -really-quiet -softvol -volume 25 /usr/share/sounds/freedesktop/stereo/bell.oga 2>&/dev/null"
alias bingrep="grep -obUaP"
alias cd..="cd .."
alias _chgrp="chgrp"
alias chgrp="chgrp -v"
alias _chown="chown"
alias chown="chown -v"
alias _cp="${_g}cp -f"
alias cp="${_g}cp -i --verbose"
alias date-now="date +%Y.%m.%d-%H.%M"
alias diff="diff -X ~/.rsync-filter"
alias d="${_g}ls --color"
alias _dmesg-grab="dmesg | tee dmesg-`uname -r`-`date +%Y.%m.%d-%R`.log"
alias _dpkg-buildpackage="dpkg-buildpackage -j4 -b -rfakeroot -us -uc"
alias grep="grep --color=auto -s --exclude-dir=.AppleDesktop --exclude-dir=.AppleDouble --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=prebuilt --exclude-dir=prebuilts"
alias egrep="egrep --color=auto -s --exclude-dir=.AppleDesktop --exclude-dir=.AppleDouble --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=prebuilt --exclude-dir=prebuilts"
alias fgrep="fgrep --color=auto -s --exclude-dir=.AppleDesktop --exclude-dir=.AppleDouble --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=prebuilt --exclude-dir=prebuilts"
alias history='history 1'
alias la="${_g}ls -I 'lost+found' --color=auto -Ahlp"
alias ll="${_g}ls -I 'lost+found' --color -l"
alias loop-mount="sudo -H mount -o loop,ro,uid=jmarcet,gid=ftp,map=off,mode=0777,unhide,iocharset=iso8859-15,utf8"
alias loop-mount-udf="sudo -H mount -o loop,ro,uid=jmarcet,gid=ftp,unhide -t udf"
alias loop-umount="sudo -H umount"
alias ls="${_g}ls -I 'lost+found' --color=auto"
alias lz="${_g}ls -I 'lost+found' --color=auto -AZhlp"
alias manb="man -H"
alias mpv-vita="mpv --demuxer-lavf-format video4linux2 av://v4l2:/dev/video2 -fs"
alias _mv="${_g}mv -f"
alias mv="${_g}mv -iv --verbose"
alias patch="patch --no-backup-if-mismatch"
alias ps3gameupdates="/usr/bin/wine ~/.wine/drive_c/Program\ Files\ \(x86\)/PS3\ Game\ Updates/PS3GameUpdates.exe"
alias psc="ps xawf -eo pid,user,cgroup,args"
alias _recode_cp850-utf8="recode -f CP850/CR-LF..UTF8 -i"
alias _recode_ms-ansi-utf8="recode -f ms-ansi..UTF8 -i"
alias _recode_sjis-utf8="recode -f SJIS..UTF8 -i"
alias _recode_utf8-cp850="recode -f UTF8..CP850/CR-LF -i"
alias _rm="${_g}rm"
alias rm="${_g}rm -iv"
#alias steam="vblank_mode=0 LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1' optirun -b primus steam"
alias _rsync-fat="rsync -Prtxv --inplace --no-whole-file --numeric-ids --exclude-from=/home/jmarcet/.rsync-filter"
alias _rsync="rsync -DEHPXaxv --inplace --no-whole-file --numeric-ids --exclude-from=/home/jmarcet/.rsync-filter"
alias _screen="screen -D -R"
alias virt-viewer="env LC_ALL=C virt-viewer"
alias watch="watch -n 1"
alias _youtube-dl-pl='youtube-dl --retries 1000 --autonumber-size 2 --restrict-filenames --continue --ignore-errors --keep --verbose --prefer-free-formats --extract-audio --audio-format mp3 --audio-quality 0 -o "/storage/youtube/new/%(playlist)s/%(autonumber)s-%(title)s.%(ext)s"'
alias _youtube-dl='youtube-dl --retries 1000 --restrict-filenames --continue --ignore-errors --keep --verbose --prefer-free-formats --extract-audio --audio-format mp3 --audio-quality 0 -o "/storage/youtube/new/%(title)s.%(ext)s"'
#ffmpeg () { /usr/bin/ffmpeg -vaapi_device /dev/dri/renderD128 -i ${1} -vf 'format=nv12,hwupload' -c:v h264_vaapi -qp 32 -c:a aac -b:a 128k ${2}; }
#ffmpeg-hd () { primusrun /usr/bin/ffmpeg -hwaccel cuvid -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -preset slow -rc constqp -qp 28 -c:a aac -b:a 96k -map 0 -y ${2}; }
#ffmpeg-hd () { primusrun /usr/bin/ffmpeg -hwaccel cuvid -deint 2 -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -preset slow -b:v 2000k -acodec copy -scodec copy -map 0 -y ${2}; }
#ffmpeg-hd () { primusrun /usr/bin/ffmpeg -hwaccel cuvid -deint 2 -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -profile:v main -preset slow -rc vbr_hq -c:a libfdk_aac -b:a 96k -c:s copy -map 0:v -map 0:a:0 -metadata:s:a:0 language=spa -map 0:a:1 -metadata:s:a:1 language=eng -map 0:s -metadata:s:s:0 language=spa -metadata:s:s:1 language=eng -y ${2}; }
#ffmpeg-hd-nosubs () { primusrun /usr/bin/ffmpeg -hwaccel cuvid -deint 2 -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -profile:v main -preset slow -rc vbr_hq -c:a libfdk_aac -b:a 96k -c:s copy -map 0:v -map 0:a:0 -metadata:s:a:0 language=spa -map 0:a:1 -metadata:s:a:1 language=eng -y ${2}; }
#ffmpeg-sd () { primusrun /usr/bin/ffmpeg -hwaccel cuvid -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -preset slow -b:v 750k -c:a aac -b:a 96k -map 0 -y ${2}; }
#ffmpeg-sd () { primusrun /usr/bin/ffmpeg -hwaccel cuvid          -c:v h264_cuvid -i ${1} -c:v hevc_nvenc -profile:v main -preset slow -b:v 750k  -c:a libfdk_aac -b:a 96k -c:s copy -map 0:v -map 0:a:0 -metadata:s:a:0 language=spa -map 0:a:1 -metadata:s:a:1 language=eng -map 0:s -metadata:s:s:0 language=spa -metadata:s:s:1 language=eng -y ${2}; }
remove_spaces () { for f in *\ *; do mv "$f" "${f// /-}"; done }

alias _ffmpeg-invert-camera="ffmpeg -f v4l2 -i /dev/video1 -vf hflip -c:a copy -f v4l2 /dev/video0"
alias _mpv-camera-flip="mpv -vf hflip --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg --fps=60 --no-resume-playback av://v4l2:/dev/video1"
alias _mpv-camera-loopback="mpv --demuxer-lavf-format=video4linux2 --no-resume-playback av://v4l2:/dev/video0"
alias _v4l2ucp="v4l2ucp /dev/video1"

[ -e $HOME/.bash_aliases_private ] && source $HOME/.bash_aliases_private

