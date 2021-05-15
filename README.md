# Playground of Ansible and Vagrant

List of dependencies so that `vagrant up` could happen successfully.
```
Vagrant 2.2.16
Ansible 2.9.6
Python version = 3.8.5
Provider = Oracle VM VirtualBox VM Selector v6.1.16_Ubuntu
Host OS = Ubuntu 20.04.2 LTS
```

Clone Repository
```sh
$ git clone git@github.com:ronakvjain/playground.git
```

Run
```sh
$ cd ./playground
$ vagrant up
```

Summary of some features: (for more details please run `vagrant run` and review ansible roles)

HAproxy
```sh
browser: http://10.0.0.9
```

Nginx routing and App (snippet)
```
server {
        listen 80 default_server;
        server_name app.example.com;

        location /xyz {
                set $url http://127.0.0.1:8888;
                proxy_pass $url;
                access_log /var/log/nginx/app_one.access.log;
                error_log /var/log/nginx/app_one.error.log;
        }

        location /pqrs {
                set $url http://127.0.0.1:8888;
                proxy_pass $url;
                access_log /var/log/nginx/app_one.access.log;
                error_log /var/log/nginx/app_one.error.log;
        }

        location /abc {
                set $url http://127.0.0.1:8080;
                proxy_pass $url;
                access_log /var/log/nginx/app_two.access.log;
                error_log /var/log/nginx/app_two.error.log;
        }

        location /mno {
                set $url http://127.0.0.1:8080;
                proxy_pass $url;
                access_log /var/log/nginx/app_two.access.log;
                error_log /var/log/nginx/app_two.error.log;
        }

}
```

Database and DB user and firewall:
```sh
# Databases
mysql_databases:
   - name: app_one_db
     collation: utf8_general_ci
     encoding: utf8
   - name: app_two_db
     collation: utf8_general_ci
     encoding: utf8

# Users
mysql_users:
   - name: app_one
     host: "10.0.0.%"
     password: app_one_secret
     priv: "app_one_db.*:ALL"
   - name: app_two
     host: "10.0.0.%"
     password: app_two_secret
     priv: "app_two_db.*:ALL"

```
