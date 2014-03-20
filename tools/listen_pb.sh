#!/bin/bash

# 没有 terminal-notifier 的系统可是黯然失色的哦
# sudo port install terminal-notifier @1.5.1

jira_url=$1
[ -z $jira_url ] && echo "listen_pb jira_url" && exit 1

# run
(
copied=""
while true; do
    text="`pbpaste`"
    if [ "$text" != "$copied" ]; then
        # stop
        if 
            echo "$text" | grep -q '^:stop:$'
        then
            echo -n | pbcopy && exit
        fi

        # jira
        if 
            echo "$text" | grep -q -E '^j:[a-zA-Z]+-[0-9]+'
        then
            jira_number=`echo "$text" | sed  -E 's/^j://g' | tr [:lower:] [:upper:]`
            jira="http://$jira_url:8080/browse/$jira_number"
            echo $jira_number | pbcopy
            terminal-notifier \
                -title "一个 JIRA 号，是否要打开？" \
                -message "$jira" \
                -open $jira \
                -group jira
        fi

        # url
        if 
            echo "$text" | grep -q -e '^l:http://' -e '^l:https://'
        then
            url=`echo "$text" | sed -E 's/^l://g'`
            echo $url | pbcopy
            terminal-notifier \
                -title "打开链接？" \
                -message "$url" \
                -open "$url" \
                -group url
        fi

        # mail
        if
            echo "$text" | grep -q -e '^m:[^:]*@.*\..*' 
        then
            mail=`echo "$text" | sed -E 's/^m://g'`
            echo $mail | pbcopy
            terminal-notifier \
                -title "给 ta 发邮件？" \
                -message "$mail" \
                -execute "open 'mailto:$mail'" \
                -group mail
        fi

        # translate
        if
            echo "$text" | grep -q -e '^t:' 
        then
            word=`echo "$text" | sed -E 's/^t://g'`
            result=`translate "$word"`
            echo $word | pbcopy
            terminal-notifier \
                -title "翻译结果" \
                -message "$result" \
                -open "http://translate.google.cn/?hl=en" \
                -group translate
        fi

        # cmd
        if
            echo "$text" | grep -q -e '^cmd:' 
        then
            cmd=`echo "$text" | sed -E 's/^cmd://g'`
            echo $cmd | pbcopy
            output=`$cmd 2>&1` && result='success' || result='failed'
            terminal-notifier \
                -title "$cmd is $result" \
                -message "$output" \
                -group cmd
        fi

        # cmd
        #if
        #    echo $text | grep \
        #        -e '^cmd:' \
        #        > /dev/null
        #then
        #    shell=`pbpaste | head -n 1 | sed 's/^cmd://g'`
        #    pastefile="/tmp/paste_`date +%s`.log"
        #    res="`pbpaste | sed 1d | $shell 2>&1`"
        #    echo "pbpaste | sed 1d | $shell 2>&1"
        #    echo "$res" > $pastefile

        #    terminal-notifier \
        #        -title "处理结果贴回剪贴板？" \
        #        -message "$res" \
        #        -execute "export LC_ALL='zh_CN.UTF-8';cat \"$pastefile\" | pbcopy;rm \"$pastefile\"" \
        #        -group cmd
        #fi

        # store
        #if
        #    echo $text | grep \
        #        -e '^store$' \
        #        > /dev/null
        #then
        #    pastefile="/tmp/paste_`date +%s`.log"
        #    echo "$copied" > $pastefile

        #    terminal-notifier \
        #        -title "点击取回粘贴板" \
        #        -message "$copied" \
        #        -execute "export LC_ALL='zh_CN.UTF-8';cat \"$pastefile\" | pbcopy;rm \"$pastefile\"" 
        #fi
    fi
    copied="$text"
    sleep 1
done 
) > /dev/null 2>&1 \
&& terminal-notifier \
        -title "关闭成功" \
        -message "terminal-notifier已关闭" \
        -group notify > /dev/null \
|| terminal-notifier \
        -title "原地复活?" \
        -message "terminal-notifier挂了" \
        -execute "source /Users/jason/.bash_profile;listen_pb trac.haodf.net" \
        -group notify > /dev/null \
&
