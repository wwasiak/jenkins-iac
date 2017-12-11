# Jenkins setup

## Prerequisites

- CentOS Linux target machine.
  This manual was tested in CentOS 7.3 Linux machine.
  
- Management machine with Ansible 2.2+ (tested on 2.2.1.0).


## Jenkins rpm package installation

Download the [Jenkins setup automation](jenkins-setup.yaml) recipe with [parameter file](group_vars/all).

Edit the parameter file (`group_vars/all`). Adjust the variables content if needed.

```
#where the /var/lib/jenkins content will be moved. a lot of space is needed
jenkins_home: /opt/mount1/jenkins

#proxy file location
proxy_file_location: /etc/environment

#proxy server for OS - each line can be commented out
http_proxy: "http://web-proxy:8080"
https_proxy: "http://web-proxy:8080"
no_proxy: "localhost,127.0.0.1"

#proxy server for Jenkinks
jenkins_http_proxy: "web-proxy"
jenkins_http_proxy_port: 8080

jenkins_admin_username: admin
#if not defined - initial password file is taken
#jenkins_admin_password: ""

jenkins_url: 'http://localhost:8080/'
jenkins_admin_email: 'admin@test.com'

jenkins_default_recipient_list: ''

#example
#jenkins_plugins:
#  token-macro:
#    enabled: yes
#  build-pipeline-plugin:
#    version: "1.4.9"
#    pinned: no
#    enabled: yes

jenkins_plugins:
  ant:
    enabled: yes
(...)

#do we show jenkins password in the console
show_password: true
```

Run the recipe.

Log in to the target machine.

Jenkins home directory is set to `/opt/mount1/jenkins`.

Jenkins listens on port 8080 by default.

Extract initial admin password (you will be asked for it later). If you didn't change jenkins_home directory, it is stored in the following file.

```
cat /opt/mount1/jenkins/secrets/initialAdminPassword
```


## Jenkins initial manual configuration

Open browser and enter the URL:

http://MACHINE:8080/

The installation wizard will open. Close it using `X` icon.

Now this Jenkins installation is practically ready for work.


