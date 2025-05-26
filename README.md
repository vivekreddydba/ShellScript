# 🐚 Shell Scripting - Overview for DevOps

## 📘 What is Shell ?
**Shell**  refers to a user interface that allows users to interact with the operating system (OS) or execute commands. 

It acts as a command interpreter, taking commands entered by the user (via a command-line interface or graphical interface) and executing them by communicating with the OS kernel.

🎯 In most Linux systems, bash [Bourne Again SHell] is the default shell.

🛠️ Types of Shells

| Shell Name                    | Command | Description                                    |
| ----------------------------- | ------- | ---------------------------------------------- |
| **Bourne Shell**              | `sh`    | Original shell from Unix                       |
| **Bash** (Bourne Again Shell) | `bash`  | Most commonly used shell in Linux              |
| **Korn Shell**                | `ksh`   | Enhanced version of Bourne shell               |
| **C Shell**                   | `csh`   | C-like syntax, good for programmers            |
| **Z Shell**                   | `zsh`   | Feature-rich, used in modern distros and macOS |


🧾 Shell vs Terminal vs Console

| Term         | Meaning                                                               |
| ------------ | --------------------------------------------------------------------- |
| **Shell**    | Program that interprets your commands (`bash`, `sh`, etc.)            |
| **Terminal** | Interface to interact with the shell (GUI or CLI Terminal) |



```csharp
      [User]
        ↓
  [Console / Terminal]  # CLI 
        ↓
      [Shell]           # e.g., bash, zsh - interprets user commands
        ↓
     [Kernel]           # Core of the OS managing system resources
        ↓
     [Hardware]         # Physical components (CPU, disk, etc.)
```

How to check How many shells are there in my Linux server?
```
cat /etc/shells
```
How to install csh?
```
sudo yum install csh -y
sudo yum install zsh -y
sudo yum install ksh -y
```

How to check which shell we are using now?
```
echo $SHELL
echo $0
ps -p $$
```

How switch to another shell?
step 1: check what are the shells are available
```
cat /etc/shells
```
step 2: How to switch to another shell
``` 
/bin/sh
ps -p $$
```
step 3: come back to bash 
```
/bin/bash
```

## 📘 What is Shell Scripting?
**Shell Scripting** is the process of writing a series of shell (terminal) commands in a file to automate tasks. These scripts typically use **Bash**, the most common Unix/Linux shell.

> A shell script is just a `.sh` file containing Linux commands + control logic (loops, conditions, variables, etc.)

---

## 📌 Why Shell Scripting is Used

| Purpose                      | Explanation / Example                                                            |
|-----------------------------|----------------------------------------------------------------------------------|
| ✅ Automation                | Automate repetitive system tasks (backups, updates, deployments).               |
| 🔁 Batch Processing          | Run multiple commands sequentially or conditionally.                            |
| 🧪 DevOps CI/CD Pipelines    | Used in Jenkins pipelines, GitHub Actions, Ansible, etc.                        |
| 🔐 User/Permission Management| Automate creation of users, groups, file permissions.                           |
| 📦 Software Installation     | Automate installation and setup of tools (Docker, K8s, Apache, etc).            |
| 📊 Log Parsing & Monitoring  | Extract and analyze logs using `grep`, `awk`, `sed`.                            |
| 🔍 Health Checks             | Monitor services and trigger auto-recovery scripts.                            |

---

## 💡 Real-time DevOps Use Cases

| Use Case                     | Description                                                                      |
|-----------------------------|----------------------------------------------------------------------------------|
| Jenkins Integration         | Shell scripts are used to build, test, and deploy code via pipelines.           |
| Docker Setup                | Automate Docker installation, image builds, and container runs.                 |
| Monitoring Services         | Cron + shell to monitor `nginx`, `httpd`, `tomcat`, etc.                        |
| AWS Automation              | Use with `aws cli` to manage EC2, S3, and IAM.                                  |
| Backup Scripts              | Automate DB/file backups to S3 or remote servers.                               |

---

## 🧠 Prerequisites to Learn Advanced Shell Scripting

| Area                 | What You Need to Know                                                                 |
|----------------------|---------------------------------------------------------------------------------------|
| ✅ Linux Basics       | Commands like `cd`, `ls`, `cp`, `mv`, `rm`, `ps`, `chmod`, `find`, `echo`, etc.      |
| ✅ Terminal Use       | Comfort using terminal and navigating file system.                                   |
| ✅ File Permissions   | Understand `chmod`, `chown`, `umask`, `sudo`.                                        |
| ✅ Text Processing    | Use `grep`, `awk`, `sed`, `cut`, `sort`, `uniq`.                                     |
| ✅ Redirection        | `>`, `>>`, `<`, `|`, `2>&1`, `/dev/null` usage.                                     |
| ✅ Process Control    | Commands: `ps`, `kill`, `top`, `&`, `jobs`, `nohup`.                                 |
| ✅ Basic Scripting    | Use of `if`, `for`, `while`, `case`, variables, and functions.                       |
| ✅ Cron Jobs          | Set up and manage scheduled tasks using `crontab`.                                   |
| ✅ Regex Basics       | Familiarity with Regular Expressions.                                                |
| ✅ DevOps Integration | (Optional) Jenkins, Docker, AWS CLI, Ansible, etc.                                   |
| ✅ Personal           | Commitment & Problem Solving Skills                                                  |
---

## 🔧 Sample Script - Apache Watchdog

```bash
#!/bin/bash
if ! systemctl is-active --quiet apache2; then
    echo "Apache is not running! Restarting..."
    systemctl restart apache2
    echo "Apache restarted at $(date)" >> /var/log/apache_watchdog.log
else
    echo "Apache is running fine."
fi
```

## 🔧 Sample Script - How to write a shell script?

```
vi Demo.sh

#!/bin/bash
echo "Welcome to shellscript Rushi Tech"
echo "Today date is"
date
```

## 🔧 How many ways you are going to run the script?

1) sh Demo.sh
2) ./Demo.sh  # chmod u+x Demo.sh
3) . Demo.sh
4) bash Demo.sh


How to run the shell script in debug mode?

```
sh -x Demo.sh  # It will gives the output as command and output
```
2.  To run few commands in debug mode.

```
cat Demo.sh

#!/bin/bash
set -x  #starting point
echo "Welcome to shellscript 
echo "Today date is"
set +x #end point
date

sh -x Demo.sh  # From starting it will run debug mode until reaches +x
```

## 🔧 Comments in shell scripting
Comments are essential for improving code readability documenting your script explaining the purpose of specific commands or sections

Types of Comments:

1. Single-line Comments:

Single-line comments start with # and extend to the end of the line.
Example:

```
cat Demo.sh

# This is a demo script
#!/bin/bash
set -x 
echo "Welcome to shellscript 
echo "Today date is"
set +x
date
```

2. Inline Comments:

Inline comments are placed at the end of a command line to provide brief explanations.
Example:

```
cat Demo.sh


#!/bin/bash
set -x  # Stratig Debug Mode
echo "Welcome to shellscript" 
echo "Today date is"
set +x # Stratig Debug Mode
date # Todays Date
```

3. Multi-line Comments:

Example 1:

```
cat Demo.sh

#!/bin/bash
#echo "Welcome to shellscript" 
#ls
echo "Today date is"
date 
```
Example 2:

```
cat Demo.sh

#!/bin/bash
: <<'COMMENT'
echo "Welcome to shellscript" 
ls
COMMENT
echo "Today date is"
date 
```
