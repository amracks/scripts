#!/bin/sh

#readmail.sh by Andrew Marks
#check which mailboxes have unread mail with fetchmail -c
#parse corresponding lines in fetchmailrc file
#open corresponding mailboxes with mutt and imap or imaps

FETCHMAIL="/usr/bin/fetchmail"
FETCHMAILRC="/home/amrx/.fetchmailrc"
MUTT="/usr/bin/mutt"
mail_stats=`${FETCHMAIL} -c | awk '{print $1$3}' | sed 's/(/:/'`
index=2

readmailatline () {
    proto="imap"
    if [ -z ${1} ]; then
        exit 1
    fi
    line=`sed -n ${1}p ${FETCHMAILRC}`
    for word in ${line}
    do
        if [ ${next} ]; then
            case ${next} in
            1)
                server=${word}
                ;;
            2)
                user=`expr "${word}" : '"\(..*\)"'`
                ;;
            3)
                pass=`expr "${word}" : '"\(..*\)"'`
                ;;
            *)
                ;;
            esac
            unset next
        else
            case ${word} in
            [Pp][Oo][Ll][Ll])
                next="1"
                ;;
            [Uu][Ss][Ee][Rr])
                next="2"
                ;;
            [Pp][Aa][Ss][Ss])
                next="3"
                ;;
            [Ss][Ss][L])
                proto="imaps"
                ;;
            *)
                unset next
                ;;
            esac
        fi
    done

    ${MUTT} -f ${proto}://${user}:${pass}@${server}
    return 0
}

for mailbox in ${mail_stats}
do
    total=`expr "${mailbox}" : '\([0-9][0-9]*\)'`
    seen=`expr "${mailbox}" : '.*:\([0-9][0-9]*\)'`
    if [ ${seen} -lt ${total} ]; then
        readmailatline ${index}
    fi
    index=$(( index + 1 ))
done

exit 0
