#### 1. Installing bind and bind utils.
- Firstly we need to install bind, to configure our dns 
```
yum install bind bind-utils -y
``` 
#### 2. Adding two different zones
- Now we configure `/etc/named.conf` file where we add two zones , you can find zones and full configuration in `named.conf`.
Results of resolved hostnames:  
- Zone files
    - Zone-1 `fwd.mystore.hu.db` 
    - Zone-2 `fwd.rhce.exam.local.db`

Zone-1
![alt text](../images/1-zone-resolve.png)
Zone-2
![alt text](../images/zone-2-resolve.png)
![alt text](../images/zone-2-resolve2.png)

#### 3.Configure slave dns 
slave configuration is in `slave-dns-named.conf`.
![alt text](../images/slave-dns.png)

#### 4. Configuring reverse zone (ip to hostname)
- we need to add configuration in `reverse-zone.conf` to `/etc/named.conf` file, then we have to create zone file with a name which specified as `user.az.db`
- we can see PTR records as below 
![alt text](../images/reverse-zone.png)


