#!/bin/bash

DATE=`date '+%Y-%m-%d %H:%M:%S'`
DIRECTORY=`pwd`
OPC_DIRECTORY=`userscripts`

cd /home/opc
mkdir $OPC_DIRECTORY

if [ ! $(ls -A install.test) ]; then
    # install stuff
    sudo yum -y install ansible yum-utils python-pip git terraform python-oci-cli
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum -y install docker-ce docker-compose
    sudo useradd lab01
    sudo useradd lab02
    sudo useradd lab03
    sudo useradd lab04
    sudo useradd lab05
    sudo useradd lab06
    sudo useradd lab07
    sudo useradd lab08
    sudo useradd lab09
    sudo useradd lab10
    sudo useradd lab11
    sudo useradd lab12
    sudo useradd lab13
    sudo useradd lab14
    sudo useradd lab15
    sudo useradd lab16
    sudo useradd lab17
    sudo useradd lab18
    sudo useradd lab19
    sudo useradd lab20

    cat <<-EOF > playbook.yml
---

# Install locally newest docker and start it as a service
- name: run the playbook tasks on the localhost
  connection: local
  hosts: localhost
  become: yes
  tasks:

  - name: Install pip
    yum:
        name: python-pip
        state: latest

  - name: Install docker
    yum:
        name: docker-ce
        state: latest

  - name: Enable docker as service
    systemd:
      name: docker
      enabled: yes

  - name: Start docker as service
    systemd:
      name: docker
      state: started
EOF

    cat <<-EOF > bootstrap.sh
#!/bin/bash
# verification script
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload

# https://geraldonit.com/2017/08/14/disable-selinux-on-oracle-linux/
# setenforce 0
# vim /etc/sysconfig/selinux  --> SELINUX=permissive
sudo setenforce 0
sudo sed  -i 's/\(^SELINUX=\).*/\1permissive/' /etc/sysconfig/selinux

sudo systemctl enable docker
sudo systemctl restart docker
git clone https://github.com/jjwarzecha/guacamole_docker.git
cd guacamole_docker
sudo docker-compose up -d
echo "done" > install.test
EOF

    cat <<-EOF > playbook2.yml
---

# Install locally newest docker and start it as a service
- name: run the playbook tasks on the localhost
  connection: local
  hosts: localhost
  become: yes
  tasks:

  - name: Run a script only if local file install.test does not exist on the node
    script: ./bootstrap.sh
    args:
      creates: ./install.test
EOF

    ansible-playbook playbook.yml
    ansible-playbook playbook2.yml
    sudo chmod +x ./bootstrap.sh
    sudo ./bootstrap.sh

else
    #stop files still remain
    echo "[info] installation has been previously completed"
fi


echo "script activated $DATE, $DIRECTORY" >> install.test

