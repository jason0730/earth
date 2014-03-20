
[ -z $1 ] && echo 'sh a.sh a.zip' && exit 1

# convert
unzip -c $1 |  iconv -f utf8 -t gbk |\

# format
grep -A  48  '</Row><Row>' | grep -e '</Row><Row>' -e '<Data ss:Type' |\
sed '1,2d' | sed '$d' | sed '$d' | xargs -d '\n' -n 17  echo |\
sed -r 's/[ ]+<Data ss:Type="String">([^<]+)<\/Data>/|\1/g' | sed 's|</Row><Row>\|||' |\

# count
cut -d '|' -f 5,6,7 | grep '½»Ò×' |\
awk -F '|' '{if ($3 > 60 && $3 <700) print $1;}' #| cut -d '_' -f2 | wc -l
