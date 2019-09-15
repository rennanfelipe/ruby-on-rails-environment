# Automate Ruby On Rails installation scripts!
## HOW TO USE:
Type on terminal:
```console
host@host:~$ vagrant up
host@host:~$ vagrant ssh
vagrant@ubuntu-xenial:~$ cd work-dir
vagrant@ubuntu-xenial:~$ chmod +x ruby-setup2.sh
vagrant@ubuntu-xenial:~$ ./ruby-setup2.sh
```
After proced the installation steps, you need to exit from vagrant and re-enter to finish the installation:
```console
vagrant@ubuntu-xenial:~$ exit
host@host:~$ vagrant ssh
vagrant@ubuntu-xenial:~$ ./work-dir/ruby-setup2.sh
vagrant@ubuntu-xenial:~$ exit
host@host:~$ vagrant ssh
```
After that you can use the new Ruby on Rails environment!
## LAUNCH A RAILS SERVER:
To launch rails server, type:
```console
host@host:~$ rails server -b 0.0.0.0
```
And access [localhost:3000](http://localhost:3000).
