#!/bin/bash
SECRET="your-secret"
BBB_URL="your-server"

meetings=$(curl -s "${BBB_URL}/bigbluebutton/api/getMeetings?checksum=$(echo -n "getMeetings${SECRET}" | sha1sum | cut -d' ' -f1)")
participants=$(echo "$meetings" | grep -oP '<participantCount>\K\d+')

total=0
for i in $participants; do
  total=$((total + i))
done

echo $total
