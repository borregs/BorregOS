#if [ $UID -ne 0] ; then
#	alias 'Install'='sudo apt-get install';
#	alias 'Update'='sudo apt-get update; sudo apt-get upgrade';
#	alias 'Seek'='sudo apt-cache search';
#fi

  alias 'lds'='ls -d */';
  alias 'Lsc'='ssh -l Malbravo 148.231.83.4';
  alias 'GN'='poweroff';
	alias 'Install'='apt-get install';
  alias 'Update'='apt-get update; apt-get upgrade';
  alias 'Seek'='apt-cache search';
	alias 'cd..'='cd ..';
	alias '..'='cd ..';
	alias '...'='cd ../../../';
	alias '....'='cd ../../../../';
	alias 'mkpdir'='mkdir -pv';
	alias 'vi'='vim';
	alias 'rmi'='rm -I --preserve-root';
	alias 'mvi'='mv -i';
	alias 'cpi'='cp -i';
	alias 'lni'='ln -i';
	alias 'statcpu'='lscpu';
	alias 'statmem'='free -m -l -t';
	alias 'lsfuckedps'='ps auxf | sort -nr -k 4';
	alias 'lafuckedps'='ps auxf | sort -nr -k 4 | head -10';
# alias 'lsalias'="awk -F'=' '{print $2}' '/home/borregs/.bash_aliases'";
	alias 'mocpeter'='mocp';
  alias 'borressh'='sudo ufw allow from 192.168.1.72 to any port 22&& sudo ufw enable && sudo ufw reload && sudo ufw status';
  alias 'Sshuter'='sudo ufw reset&&sudo ufw status';
  alias 'ñ'='clear';
  alias '\\'='clear';
