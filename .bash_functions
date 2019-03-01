## Explain bash command -------------------------------------------------------
explain(){
  # If using this command gives no output, see if running a
  # simple fetch causes this error:
  # $ curl https://www.mankier.com
  # curl: (35) Cannot communicate securely with peer: no common encryption
  # algorithm(s). If so, try specifying a cipher in the curl commands:
  # curl --ciphers ecdhe_ecdsa_aes_128_sha

  local api_url="https://www.mankier.com/api/explain/?cols="

  if [ "$#" -eq 0 ]; then
    while read  -p "Command: " cmd; do
      curl -Gs ${api_url}$(tput cols) --data-urlencode "q=$cmd"
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs ${api_url}$(tput cols) --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}

nlines(){ sed -n '$=' $1 ;}                 # Number of lines in text file
fp(){ find . -type f -iname '*'$*'*' -ls ;} # Find file with a pattern

## find and execute
fe(){ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \; ;}

## disc usage
dus(){ find $@ -maxdepth 1 -exec du -sh --apparent-size {} \; |sort -h ;}
dusl(){
    find $@ -maxdepth 1 -type d -exec du -sh --apparent-size {} \; |sort -h
}

## change filenames to lower-case ---------------------------------------------
lowercase(){
  for file ; do
    filename=${file##*/}
    case "$filename" in
      */*) dirname==${file%/*} ;;
      *) dirname=.;;
    esac
    nf=$(echo $filename | tr A-Z a-z)
    newname="${dirname}/${nf}"
    if [ "$nf" != "$filename" ] && [ ! -d $newname ]; then
      echo "lowercase: $file --> $newname"
      mv -i "$file" "$newname"
    else
      [ -d $newname ] && echo "$newname directory exists."
      echo "lowercase: $file not changed."
    fi
  done
}

## Current Process ------------------------------------------------------------
myps(){ ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;}
pp(){ myps f | awk '!/awk/ && $0~var' var=${1:-".*"} ;}
ppc(){ pp | sort -k2 -n ;}
ppm(){ pp | sort -k3 -n ;}

