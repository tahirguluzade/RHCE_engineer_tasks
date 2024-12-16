#### 1. Installing bind and bind utils.
- Firstly we need to install bind, to configure our dns 
```
yum install bind bind-utils -y
``` 
#### 2. Adding two different zones
- Now we configure `/etc/named.conf` file where we add two zones , you can find zones and full configuration in `named.conf`.
Results of resolved hostnames:  
- Zone files
    - Zone-1 `fwd.mystore.hu.zone` 
    - Zone-2 `fwd.rhce.exam.local.zone`

Zone-1
<img src="../images/1-zone-resolve.png" width=400 height=200>
Zone-2
<img src="../images/zone-2-resolve.png" width=400 height=100>
<img src="../images/zone-2-resolve2.png" width=400 height=50>


#### 3.Configure slave dns 
slave configuration is in `slave-dns-named.conf`.
<img src="../images/slave-dns.png" width=400 height=100>

#### 4. Configuring reverse zone (ip to hostname)
- we need to add configuration in `reverse-zone.conf` to `/etc/named.conf` file, then we have to create zone file with a name which specified as `user.az.zone`
- we can see PTR records as below 
<img src="../images/reverse-zone.png" width=500 height=100>

#### 5. Mapping one domain to another one.
- we use CNAME record for domain aliases.(look records in `fwd.mystore.hu.zone`). Let's see how changes applied.
<img src="../images/CNAME.png" width=400 height=200>

#### 6. To force slave immediately update when master zone changed. 
To do this we have to add  below syntax to `/etc/named.conf ` in options section check `named.conf` file.

```
    notify yes;
    also-notify { 192.168.134.12; };
```

This tells to slave DNS to refresh changes from master immediately when it is changed. Process takes effect when you restart "named" service in master server. You can follow logs from `/var/named/data/named.run` file.
Run `tail -f /var/named/data/named.run` and then make changes in master dns. 

Note that change refresh number to small minutes.
These logs are from named.run file
<img src="../images/Slave-transfer.png" width=600 height=100>
