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

### 📌 Why Shell Scripting is Used

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

### 💡 Real-time DevOps Use Cases

| Use Case                     | Description                                                                      |
|-----------------------------|----------------------------------------------------------------------------------|
| Jenkins Integration         | Shell scripts are used to build, test, and deploy code via pipelines.           |
| Docker Setup                | Automate Docker installation, image builds, and container runs.                 |
| Monitoring Services         | Cron + shell to monitor `nginx`, `httpd`, `tomcat`, etc.                        |
| AWS Automation              | Use with `aws cli` to manage EC2, S3, and IAM.                                  |
| Backup Scripts              | Automate DB/file backups to S3 or remote servers.                               |

---

### 🧠 Prerequisites to Learn Advanced Shell Scripting

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

### 🔧 Sample Script - Apache Watchdog

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

### 🔧 Sample Script - How to write a shell script?

```
vi Demo.sh

#!/bin/bash
echo "Welcome to shellscript Rushi Tech"
echo "Today date is"
date
```

### 🔧 How many ways you are going to run the script?

1) sh Demo.sh
2) ./Demo.sh  # chmod u+x Demo.sh
3) . Demo.sh
4) bash Demo.sh


### How to run the shell script in debug mode?

1) To run entire script(all commands) in debug mode

```
sh -x Demo.sh  # It will gives the output as command and output
```
2)  To run few commands in debug mode.

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

### 🔧 Comments in shell scripting
Comments are essential for improving code readability documenting your script explaining the purpose of specific commands or sections

### Types of Comments:

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

* Example 1:

```
cat Demo.sh

#!/bin/bash
#echo "Welcome to shellscript" 
#ls
echo "Today date is"
date 
```
* Example 2:

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
---
## 🐧 Variables in Linux – Complete Guide

A variable is a placeholder to store data that can be used and modified throughout a script. It helps with flexibility, reusability, and maintainability in scripting.

In Linux (especially in shell scripting), **variables** are used to store data that can be used and manipulated throughout the script or command line session.

### 📌 Why Use Variables in Linux?

- Store and reuse values (e.g., paths, user input, command output)
- Improve script readability and maintainability
- Enable parameterization of scripts

### ✅ Variable Naming Rules
- Must start with a letter (A-Z, a-z) or underscore (_)

- Can contain letters, numbers, and underscores (_)

- No spaces, dashes, or special characters like !, @, *, etc.

- Variables are case-sensitive (VAR1 ≠ var1)

- Avoid using reserved shell keywords (like if, then, fi, for)


### 🔸Types of Variables in Linux

| Variable Type         | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Local Variables**   |  Variables that you define yourself within your shell script. They are used to store values that can be referenced and manipulated throughout the script. User-defined variables can be assigned values using the assignment operator = and accessed using the $ symbol followed by the variable name.  |
| **Environment Variables** | Global variables that affect system behavior or shell behavior.These are predefined variables that are set by the operating system or shell environment.System variables are typically written in all caps, and some common examples include $PATH, $HOME, and $USER.         |
| **Shell Variables**   | Predefined or user-defined variables available to the shell.               |
| **Positional Parameters** | Used to hold arguments passed to scripts or functions.                   |
| **Special Variables** | Internal shell variables like `$?`, `$$`, `$!`, etc.                        |
---
### 🔹 1. Local Variables

Defined in the current shell or script. Not available to sub-processes.

```bash
#!/bin/bash
name="LinuxUser"
echo "Hello, $name"
```

---

### 🔹 2. Environment Variables

Exported to child processes. Used by the shell and system programs.

### Example:

```bash
export PATH="/usr/local/bin:$PATH"
echo $PATH
```

### Common Environment Variables:

| Variable   | Purpose                          |
|------------|----------------------------------|
| `PATH`     | Directories to search for commands |
| `HOME`     | Current user's home directory     |
| `USER`     | Current logged-in username        |
| `SHELL`    | Current shell                     |
| `EDITOR`   | Default editor (e.g., vim, nano)  |

---

### 🔹 3. Shell Variables

These are set by the shell and used internally or by the user.

### Example:

```bash
echo $BASH_VERSION
```

| Shell Variable | Description                      |
|----------------|----------------------------------|
| `BASH`         | Path to the Bash binary          |
| `BASH_VERSION` | Current Bash version             |
| `UID`          | User ID of the current user      |

---

### 🔹 4. Positional Parameters

Used to access script arguments.

```bash
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All Arguments As List: $@"
echo "Number Of arguments Passed: $#"
```

| Symbol | Description               |
|--------|---------------------------|
| `$0`   | Script name               |
| `$1`   | First argument            |
| `$2`   | Second argument           |
| `$@`   | All arguments as list     |
| `$#`   | Number of arguments       |

---

### 🔹 5. Special Variables

Shell maintains special-purpose variables.

| Variable | Meaning                                                                 |
|----------|-------------------------------------------------------------------------|
| `$?`     | Exit status of last command (0 = success)                               |
| `$$`     | PID of the current shell                                                |
| `$!`     | PID of the last background process                                      |
| `$@`     | All arguments as separate words                                         |
| `$#`     | Total number of arguments                                               |

```bash
#!/bin/bash
echo "Current PID: $$"
ls /tmp
echo "Last command exit status: $?"
```

---

### 🧪 Real-Time Use Case Example

```bash
#!/bin/bash

backup_dir="/backup"
current_date=$(date +%F)

mkdir -p "$backup_dir/$current_date"
echo "Backup directory created at $backup_dir/$current_date"
```

✅ This script:
- Uses a local variable `backup_dir`
- Uses a command substitution to assign `current_date`
- Makes a directory with the current date under `/backup`

---

### 📎 Check All Environment Variables

```bash
printenv      # or env
```

---

### 📎 Set and Unset Variables

```bash
VAR1="hello"
unset VAR1
```
---
### Example Script With System(Environment) Variables & User Defined Vars

```
#!/bin/bash

# System Variables

echo "System Variables"
echo
echo "Bash: $BASH" # Prints the location of bash
echo "User: $USER" # Prints the name of the user
echo "Home: $HOME" # Prints the home directory
echo "Bash version: $BASH_VERSION" # Prints the bash version
echo "Current directory: $PWD" # Prints the working directory
echo "Path to the location of the script: $PATH" # Prints the path to the current directory of the shell script

#User defined variables

echo
echo "User Defined Variables"
first_name="Balaji"
last_name="Reddy"
echo "My name is $first_name $last_name"
```
---
# 📄 Ways to Assign or Pass Values to Variables in Shell Script

In Shell Scripting (especially Bash), there are **several ways to assign or pass values to variables**, depending on the context and usage. Here's a complete breakdown with examples:

---

## ✅ 1. Direct Assignment
Assign a value directly inside the script.

```bash
name="Balaji"
age=30
```

- **No spaces** around `=`
- Double quotes are preferred to avoid issues with spaces or special characters.

---

## ✅ 2. Using `export` (For Environment Variables)
Makes the variable available to child processes. Convention Define Varibale Name in CAPS

```bash
echo "PATH is: $PATH"
export MYVAR="Linux"
echo "MYVAR: $MYVAR"
```

Used when you want the variable accessible to subprocesses (like in other scripts).

---

## ✅ 3. Read from User Input (`read` command)
Prompt the user to enter a value.

```bash
echo "Enter your name:"
read name
echo "Your name is: $name"
```

Use `-p` to prompt inline:

```bash
read -p "Enter age: " age
echo "Age is $age"

```

Use `-p` with -t  to prompt inline and time out after given time:

```
# Enter your input with in 5 Secs
read -t 5 -p "Enter Your Name: " name
# Condition to check if name is empty or not
if [ -z "$name" ]; then
  echo "Timeout occurred."
else
  echo "Your name: $name"
fi
```
---

## ✅ 4. Command Substitution (`$(...)` or backticks)
Assign the output of a command to a variable.

```bash
today=$(date) # Recomnded Way Of Command Substitution
host_name=`hostname` # Old And Not Recomended

echo "today date is $today"
echo "System HostName: $host_name"

```

---

## ✅ 5. From Script Arguments (Positional Parameters)
Capture values passed when running the script.

```bash
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"
```

Run as:
```bash
./script.sh Balaji 30
```

---

---

## ✅ 6. Using `source` or `.` command (From external file)
Assign variables from another file.

### `vars.sh`:
```bash
username="admin"
password="secret"
```

### `main.sh`:
```bash
source ./vars.sh
echo "Username is $username"
```

---

## ✅ 8. Using `declare` or `typeset` (for attribute assignment)
Used to restrict or define variable types.

```bash
declare -i num=10   # integer only
typeset -r pi=3.14  # read-only (cannot change)
```

---

## ✅ 9. Using `eval` (Evaluate a dynamically built expression)
⚠️ Use with caution (security risk).

```bash
varname="username"
value="admin"
eval "$varname=$value"
echo $username
```
---

The eval command in shell scripting is used to evaluate (or execute) a string as a command after variable expansion.

It takes a string as input, evaluates it twice (first for variable substitution, then for execution), and then executes it as if it were a shell command.

#### 🔹 Why Use eval?

- To execute dynamically constructed commands.

- To handle indirect references (e.g., variables whose values are variable names).

- To parse complex command strings stored in variables.

#### 🔹 How eval Works – Step-by-Step
```
list="ls -l"
eval $list

```
1 Shell reads eval $list.

2 Substitutes $list with ls -l.

3 Executes ls -l.

#### ⚠️ Warning with eval
eval can be dangerous, especially with untrusted input, because it executes arbitrary code. For example:
```
input="rm -rf /"
eval $input
```
#### ⚠️ This will delete everything on your system if run as root.
---

## 📋 Summary Table

| Method                  | Description                      | Example                   |
|-------------------------|----------------------------------|---------------------------|
| Direct Assignment       | Static assignment                | `x=10`                    |
| `export`                | For child processes              | `export PATH=/usr/bin`   |
| `read`                  | Input from user                  | `read name`              |
| Command Substitution    | Assign command output            | `today=$(date)`          |
| Positional Parameters   | Script arguments                 | `$1, $2, $3...`           |
| `source` or `.`         | Load from external file          | `source vars.sh`         |
| `declare` / `typeset`   | Set variable type/attributes     | `declare -i age=25`       |
| `eval`                  | Dynamic assignment (caution)     | `eval "$varname=value"`   |

