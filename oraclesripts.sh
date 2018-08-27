What is the importance of executing orainstRoot.sh and root.sh scripts in Oracle Standalone and RAC environment?
Hi,
As a part of post installation steps,we execute two scripts 'orainstRoot.sh' and 'root.sh' scripts and Oracle also suggest to backup the 'orainstRoot.sh' and 'root.sh' scripts.These two scripts we should execute as 'root' user as it displays after the Oracle software installation completes.

 Executing orainstRoot.sh script:
==================================

[oracle@localhost oraInventory]$ su
Password:
[root@localhost oraInventory]# pwd
/u02/app/oraInventory
[root@localhost oraInventory]# ls -ltr
total 28
drwxrwx--- 2 oracle oinstall 4096 Sep  4 07:09 logs
-rw-rw---- 1 oracle oinstall  293 Sep  4 07:09 oraInstaller.properties
drwxrwx--- 2 oracle oinstall 4096 Sep  4 07:09 oui
-rw-rw---- 1 oracle oinstall   37 Sep  4 07:29 install.platform
drwxrwx--- 2 oracle oinstall 4096 Sep  4 07:29 ContentsXML
-rwxrwx--- 1 oracle oinstall 1623 Sep  4 07:29 orainstRoot.sh
-rw-rw---- 1 oracle oinstall   56 Sep  4 07:29 oraInst.loc
[root@localhost oraInventory]# pwd
/u02/app/oraInventory
[root@localhost oraInventory]# id
uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),103(pkcs11)
[root@localhost oraInventory]# ./orainstRoot.sh
Changing permissions of /u02/app/oraInventory.
Adding read,write permissions for group.
Removing read,write,execute permissions for world.

Changing groupname of /u02/app/oraInventory to oinstall.
The execution of the script is complete.
[root@localhost oraInventory]# cd ..
[root@localhost app]# pwd
/u02/app

Importance of running 'orainstRoot.sh' script:
The first Script that we run is 'orainstRoot.sh' which is located in $ORACLE_BASE/oraInventory(/u01/app/oracle/oraInventory) path.We execute 'orainstRoot.sh' script for the following purposes:

1)It creates the inventory pointer file (/etc/oraInst.loc),This file shows the inventory location and group it is linked to.
2)It Changes groupname of the oraInventory directory to oinstall group.

 Executing root.sh script:
=========================
[root@localhost app]# cd oracle/product/11.2.0/dbhome_1/
[root@localhost dbhome_1]# pwd
/u02/app/oracle/product/11.2.0/dbhome_1
[root@localhost dbhome_1]# ls -altr root.sh
-rwxr-x--- 1 oracle oinstall 518 Sep  4 07:24 root.sh
[root@localhost dbhome_1]# ./root.sh
Running Oracle 11g root.sh script...

The following environment variables are set as:
    ORACLE_OWNER= oracle
    ORACLE_HOME=  /u02/app/oracle/product/11.2.0/dbhome_1

Enter the full pathname of the local bin directory: [/usr/local/bin]:
   Copying dbhome to /usr/local/bin ...
   Copying oraenv to /usr/local/bin ...
   Copying coraenv to /usr/local/bin ...


Creating /etc/oratab file...
Entries will be added to the /etc/oratab file as needed by
Database Configuration Assistant when a database is created
Finished running generic part of root.sh script.
Now product-specific root actions will be performed.
Finished product-specific root actions.

Importance of running 'root.sh' script:

The Second script that we run is 'root.sh' script which is located in $ORACLE_HOME (/u01/app/oracle/product/11.2.0/db_1) path.We execute 'root.sh' for the following purposes:

1)It will Creates a /etc/oratab file.This is the file which we use to make automatic Database shutdown and startup.
It is very important file.
2)It Sets the Oracle base and home environments.
3)It Sets an appropriate permission to the OCR base directory
4)It Creates the OCR backup and Network Socket directories.
5)It Modifies the ownership to 'root' user on the Oracle base and Cluster home filesystem.
6)It Configures the OCR and voting disks (only on the first node)
7)It Starts the Clusterware daemons.
8)It adds Clusterware daemons to the inittab file.
9)It Verifies whether the Clusterware is up on all nodes.
10)On the last node, initiates ./vipca in silent mode to configure nodeapps,
such as, GSD, VIP, and ONS for all the nodes.
11)It verifies the super user privileges.
12)It Creates a trace directory.The 'trace' directory is again very vital for generating trace file to keep a track on user sessions in case of any error,troubleshooting and diagnosis purpose.
13)It Generates OCR keys for the 'root' user.
14)It Adds daemon information to the inittab file
15)Starts up the Oracle High Availability Service Daemon (OHASD) process.
16)Creates and configures an ASM instance and starts up the instance.
17)Creates required ASM disk groups, if ASM is being used to put OCR and voting files.
18)Starts up the Cluster Ready Service Daemon (CRSD) process
19)Creates the voting disk file.
20)It Puts the voting disk on the Voting disk,if ASM type is selected.
21)It Displays voting disk details
22)Stops and restarts a cluster stack and other cluster resources on the local node
23)Backs up the OCR to a default location
24)It Installs the cvuqdisk-1.0.7-1 package
25)It Updates the Oracle inventory file.
26)Completes with the UpdateNodeList success operation.

When 'root.sh' is executed on the last node of the cluster,the following set of actions
are likely to be performed by the script:
1)It Sets Oracle base and home environmental variables.
2)The /etc/oratab file will be created
3)It Performs the super user privileges verification.
4)Adds trace directories
5)It Generates OCR keys for the 'root' user.
6)Adds a daemon to inittab
7)Starts the Oracle High Availability Service Daemon (OHASD) process.
8)It Stops/starts a cluster stack and other cluster resources on the local node
9)Performs a backup of the OCR file
10)Installs the cvuqdisk-1.0.7-1 package
11)Updates the Oracle inventory file.
12)Completes with UpdateNodeList success operation.


