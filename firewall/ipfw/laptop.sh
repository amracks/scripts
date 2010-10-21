#!/bin/sh

cmd="sudo ipfw -q add"

lif="lo0"   # Loopback Interface

eif="en0"   # Ethernet Interface
wif="en1"   # Wireless Interface

vmif1="en2" # Vmware Interface
vmif2="en3" # Vmware Interface

# Flush all rules
sudo ipfw -q flush

# Allow anything to and from loopback
${cmd} 00010 allow all from any to any via ${lif}

# Allow all dynamic "keep-state" traffic
${cmd} 00020 check-state

# Allow DNS requests from any to any going out eif and wif
${cmd} 00030 allow tcp from any to any domain out via $eif setup keep-state
${cmd} 00031 allow udp from any to any domain out via $eif keep-state
${cmd} 00032 allow tcp from any to any domain out via $wif setup keep-state
${cmd} 00033 allow udp from any to any domain out via $wif keep-state

# Allow eif and wif to make DHCP requests
${cmd} 00050 allow log udp from any to any bootps out via ${eif} keep-state
${cmd} 00051 allow log udp from any to any bootps out via ${wif} keep-state

# Allow unencrypted web traffic out on eif and wif
${cmd} 00060 allow tcp from any to any http out via ${eif} setup keep-state
${cmd} 00061 allow tcp from any to any http out via ${wif} setup keep-state

# Allow encrypted web traffic out on eif and wif
${cmd} 00070 allow tcp from any to any https out via ${eif} setup keep-state
${cmd} 00071 allow tcp from any to any https out via ${wif} setup keep-state

# Allow imaps out eif and wif for getting mail
${cmd} 00080 allow tcp from any to any imaps out via ${eif} setup keep-state
${cmd} 00081 allow tcp from any to any imaps out via ${wif} setup keep-state

# Allow sending ping probe out on eif and wif
${cmd} 00090 allow icmp from any to any out via ${eif} keep-state
${cmd} 00091 allow icmp from any to any out via ${wif} keep-state

# Allow ssh out on eif and wif
${cmd} 00100 allow tcp from any to any ssh out via ${eif} setup keep-state
${cmd} 00101 allow tcp from any to any ssh out via ${wif} setup keep-state

# Allow whois requests out on eif and wif
${cmd} 00110 allow tcp from any to any nicname out via ${eif} setup keep-state
${cmd} 00111 allow tcp from any to any nicname out via ${wif} setup keep-state


# Allow netbios out on eif
# 137=name, 138=datagram, 139=session, 81=hosts2
${cmd} 00120 allow tcp from any to any netbios\\-ns out via ${eif} setup keep-state
${cmd} 00121 allow tcp from any to any netbios\\-dgm out via ${eif} setup keep-state
${cmd} 00122 allow tcp from any to any netbios\\-ssn out via ${eif} setup keep-state
${cmd} 00123 allow tcp from any to any hosts2\\-ns out via ${eif} setup keep-state
${cmd} 00124 allow tcp from any to any microsoft\\-ds out via ${eif} setup keep-state

# Allow netbios out on wif
# 137=name, 138=datagram, 139=session, 81=hosts2
${cmd} 00130 allow tcp from any to any netbios\\-ns out via ${wif} setup keep-state
${cmd} 00131 allow tcp from any to any netbios\\-dgm out via ${wif} setup keep-state
${cmd} 00132 allow tcp from any to any netbios\\-ssn out via ${wif} setup keep-state
${cmd} 00133 allow tcp from any to any hosts2\\-ns out via ${wif} setup keep-state
${cmd} 00134 allow tcp from any to any microsoft\\-ds out via ${wif} setup keep-state

# Allow cifs out on eif and wif
${cmd} 00140 allow tcp from any to any cifs out via ${eif} setup keep-state
${cmd} 00141 allow udp from any to any cifs out via ${eif} setup keep-state

# Allow jabber and google talk on eif and wif
${cmd} 00150 allow tcp from any to any jabber\\-client out via ${eif} setup keep-state
${cmd} 00151 allow tcp from any to any jabber\\-client out via ${wif} setup keep-state

# Allow aol chat clients out on eif and wif
${cmd} 00160 allow tcp from any to any aol out via ${eif} setup keep-state
${cmd} 00161 allow tcp from any to any aol out via ${wif} setup keep-state

# Allow msn chat clients out on eif and wif
${cmd} 00170 allow tcp from any to any msnp out via ${eif} setup keep-state
${cmd} 00170 allow tcp from any to any msnp out via ${wif} setup keep-state

# Allow printing out on port 9100
${cmd} 00180 allow tcp from any to any pdl\\-datastream out via ${eif} setup keep-state
${cmd} 00181 allow udp from any to any pdl\\-datastream out via ${eif} setup keep-state
${cmd} 00182 allow tcp from any to any pdl\\-datastream out via ${wif} setup keep-state
${cmd} 00183 allow udp from any to any pdl\\-datastream out via ${wif} setup keep-state

# Allow printing on 515
${cmd} 00190 allow tcp from any to any printer out via ${eif} setup keep-state
${cmd} 00191 allow udp from any to any printer out via ${eif} setup keep-state
${cmd} 00192 allow tcp from any to any printer out via ${wif} setup keep-state
${cmd} 00193 allow udp from any to any printer out via ${wif} setup keep-state

# Deny and LOG anything else trying to get out eif and wif
${cmd} 04998 deny log all from any to any out via ${eif}
${cmd} 04999 deny log all from any to any out via ${wif}

# Allow all KNOWN inbound traffic from non-routeable reserved address spaces on eif
${cmd} 05000 allow all from 10.0.20.0/24 to any in via ${eif}       #RFC 1918 private IP
${cmd} 05001 allow all from 10.1.100.0/24 to any in via ${eif}      #RFC 1918 private IP
${cmd} 05002 allow all from 192.168.24.0/24 to any in via ${eif}    #RFC 1918 private IP

# Allow all KNOWN inbound traffic from non-routeable reserved address spaces on wif
${cmd} 05010 allow all from 10.0.20.0/24 to any in via ${wif}       #RFC 1918 private IP
${cmd} 05011 allow all from 10.1.100.0/24 to any in via ${wif}      #RFC 1918 private IP
${cmd} 05012 allow all from 192.168.24.0/24 to any in via ${wif}    #RFC 1918 private IP

# Deny all inbound traffic from non-routeable reserved address spaces on eif
${cmd} 05020 deny all from 192.168.0.0/16 to any in via ${eif}      #RFC 1918 private IP
${cmd} 05021 deny all from 172.16.0.0/12 to any in via ${eif}       #RFC 1918 private IP
${cmd} 05022 deny all from 10.0.0.0/8 to any in via ${eif}          #RFC 1918 private IP
${cmd} 05023 deny all from 127.0.0.0/8 to any in via ${eif}         #loopback
${cmd} 05024 deny all from 0.0.0.0/8 to any in via ${eif}           #loopback
${cmd} 05025 deny all from 169.254.0.0/16 to any in via ${eif}      #DHCP auto-config
${cmd} 05026 deny all from 192.0.2.0/24 to any in via ${eif}        #reserved for docs
${cmd} 05027 deny all from 204.152.64.0/23 to any in via ${eif}     #Sun cluster interconnect
${cmd} 05028 deny all from 224.0.0.0/3 to any in via ${eif}         #Class D & E multicast

# Deny all inbound traffic from non-routeable reserved address spaces on wif
${cmd} 05040 deny all from 192.168.0.0/16 to any in via ${wif}      #RFC 1918 private IP
${cmd} 05041 deny all from 172.16.0.0/12 to any in via ${wif}       #RFC 1918 private IP
${cmd} 05042 deny all from 10.0.0.0/8 to any in via ${wif}          #RFC 1918 private IP
${cmd} 05043 deny all from 127.0.0.0/8 to any in via ${wif}         #loopback
${cmd} 05044 deny all from 0.0.0.0/8 to any in via ${wif}           #loopback
${cmd} 05045 deny all from 169.254.0.0/16 to any in via ${wif}      #DHCP auto-config
${cmd} 05046 deny all from 192.0.2.0/24 to any in via ${wif}        #reserved for docs
${cmd} 05047 deny all from 204.152.64.0/23 to any in via ${wif}     #Sun cluster interconnect
${cmd} 05048 deny all from 224.0.0.0/3 to any in via ${wif}         #Class D & E multicast

# Deny all ping requests in on eif and wif
${cmd} 05050 deny icmp from any to any in via ${eif}
${cmd} 05051 deny icmp from any to any in via ${wif}

# Deny all ident
${cmd} 05060 deny tcp from any to any ident in via ${eif}
${cmd} 05061 deny tcp from any to any ident in via ${wif}

# Deny all netbios service requests in on eif
# 137=name, 138=datagram, 139=session, 81=hosts2
${cmd} 05070 deny tcp from any to any netbios\\-ns in via ${eif}
${cmd} 05071 deny tcp from any to any netbios\\-dgm in via ${eif}
${cmd} 05072 deny tcp from any to any netbios\\-ssn in via ${eif}
${cmd} 05073 deny tcp from any to any hosts2\\-ns in via ${eif}

# Deny all netbios service requests in on wif
# 137=name, 138=datagram, 139=session, 81=hosts2
${cmd} 05080 deny tcp from any to any netbios\\-ns in via ${eif}
${cmd} 05081 deny tcp from any to any netbios\\-dgm in via ${eif}
${cmd} 05082 deny tcp from any to any netbios\\-ssn in via ${eif}
${cmd} 05083 deny tcp from any to any hosts2\\-ns in via ${eif}

# Deny all late-arriving packets in on eif and wif
${cmd} 05090 deny all from any to any frag in via ${eif}
${cmd} 05091 deny all from any to any frag in via ${wif}

# Deny ACk packets that didn ot mache the dynamic rule table
${cmd} 05100 deny tcp from any to any established in via ${eif}
${cmd} 05101 deny tcp from any to any established in via ${wif}

# Allow DHCP traffic from SDSU in wif (not sure we need this)
${cmd} 05110 allow udp from 146.244.206.254 bootps to any bootpc in via ${wif} keep-state

# Allow multicast DNS in so we can see other macs
${cmd} 05120 allow udp from any to any mdns in via ${eif} 
${cmd} 05121 allow tcp from any to any mdns in via ${eif} 
${cmd} 05122 allow udp from any to any mdns in via ${wif} 
${cmd} 05123 allow tcp from any to any mdns in via ${wif} 

# Deny and LOG all other incomming traffic on eif and wif
${cmd} 05130 deny log all from any to any in via ${eif}
${cmd} 05131 deny log all from any to any in via ${wif}

# Deny and LOG all other traffic 
${cmd} 20000 deny log all from any to any
