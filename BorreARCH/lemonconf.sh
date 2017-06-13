#!/bin/sh
#
# Borregs - (c) NIXMR 2016
# Fetch info on your computer, and print them to lemonbar as stdout every second.

clock() {
    date '+%d-%m-%Y %H:%M'
}

battery() {
    BATC=/sys/class/power_supply/BAT1/capacity
    BATS=/sys/class/power_supply/BAT1/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

msg() {
	echo elBebePaquito
}

volume() {
    pamixer --get-volume 
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

memused() {
    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "$int connected" || echo "$int disconnected"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line}="; done
    line="${line}|"
    for w in `seq $((cur + 2)) $tot`; do line="${line}="; done
    echo $line
}

nowplaying() {
    cur=`mpc current`
    # this line allow to choose whether the output will scroll or not
    test "$1" = "scroll" && PARSER='skroll -n20 -d0.5 -r' || PARSER='cat'
    test -n "$cur" && $PARSER <<< $cur || echo "- stopped -"
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="${buf} %{F#EAFF01}[$(groups)]%{F-}   --  "
    buf="${buf} %{U#A1F6F6}%{+u}NET:%{-u} %{F#053B91} $(network) %{F-} %{F-} %{F#EAFF01}l%{F-}"
    buf="${buf} %{U#A1F6F6}%{+u}CPU:%{-u} %{F#053B91} $(cpuload)% %{F-} %{F#EAFF01}l%{F-}"
    buf="${buf} %{U#A1F6F6}%{+u}RAM:%{-u} %{F#053B91} $(memused)% %{F-} %{F#EAFF01}l%{F-}"
    buf="${buf} %{U#A1F6F6}%{+u}VOL:%{-u} %{F#053B91} $(volume)% %{F-} %{F#EAFF01}l%{F-}"
    #buf="${buf} MPD: $(nowplaying)"
    buf="${buf} %{F#053B91} $(clock) %{F-} %{F#EAFF01} l %{F-}"
    
    
   echo %{c}$buf%{c}
    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done




# 
#		Soy un caballito
#				Meeeeeeeeeeh
#
#   color=FCFA84 && 86F7F5
#		electric_sheep
#
#
#	color=EAFF01 && 4551F7
#		electric_dreams
#
#
#	color=A1F6F6 && 053B91
#		sparking_contrast
#
#
# so... ./this | lemonbar -F#fcfa84 -B#86f7f5 -fttf-fantasque-sans LVDS1 &
