#!/bin/sh

STATUS=FAIL
if [ $STATUS == "PASS" ]; then
  cp input_pass.template input.html
else
  cp input_fail.template input.html
fi


export MAILTO="visrani@tripwire.com"
export CONTENT="input.html"
export SUBJECT="Subject"
(
 echo "Subject: $SUBJECT"
 echo "MIME-Version: 1.0"
 echo "Content-Type: text/html"
 echo "Content-Disposition: inline"
 cat $CONTENT
) | /usr/sbin/sendmail $MAILTO

mail -s 'Subject-Here' visrani@tripwire.com < input.html
