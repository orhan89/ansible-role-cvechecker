#!/bin/bash

rm -rf /tmp/cvereport
mkdir /tmp/cvereport

if [ -x /usr/local/bin/cvechecker ]; then
    /usr/local/bin/cvechecker -r -C > /tmp/cvechecker-result.txt
fi

if [ -x /usr/local/bin/cvereport ]; then
    /usr/local/bin/cvereport -d /tmp/cvereport /usr/local/share/cvechecker/acknowledgements.xml
fi

tar czvf /tmp/cvereport.tar.gz /tmp/cvereport
mail -s "CVE Checker Report" -a /tmp/cvereport.tar.gz ricky@sense-os.nl < /tmp/cvechecker-result.txt

rm -rf /tmp/cvereport
rm /tmp/cvereport.tar.gz
