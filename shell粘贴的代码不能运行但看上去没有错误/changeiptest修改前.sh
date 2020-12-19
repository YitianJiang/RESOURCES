findfiles(){
for file in $(ls $1)
  do
    if [ -d $1"/"$file ] ;then
      findfiles $1"/"$file
　  else
      echo ${file}
    fi
  done
}
findfiles /root/system-install-and-config

