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

Run as:
```bash
./script.sh Balaji Banglore
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

Example One
```bash
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"
```

Run as:
```bash
./script.sh Balaji 30
```

Example Two

```bash
#!/bin/bash
# Assigining Script(Command Line) Args to varaibles and reffering in script
a=$1  
b=$2
name=$3
dirpath=$4

echo "First argument (a): $a"
echo "Second argument (b): $b"
echo "Third argument (name): $name"
echo "Fourth argument (dirpath): $dirpath"
```

Run as:
```bash
./script.sh 30 20 "Balaji Reddy" /home/ec2-user
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

## 📘 Best Practices for Accessing and Referring to Variables in Shell Scripts

To effectively access or refer to variables in shell scripts, consider the following practices:

- **Use descriptive names**: Choose variable names that clearly indicate their purpose.  
  _Example_: Use `file_path` instead of `fp`.

- **Use `${}` for clarity**: While `$variable` often works, `${variable}` is preferred, especially when concatenating with strings or when ambiguity might arise.  
  _Example_: `${FILE_PATH}/file.txt` instead of `$FILE_PATH/file.txt`.

- **Quote variables**: Always enclose variable references in double quotes (e.g., `"$variable"`) to prevent word splitting and globbing issues, especially when dealing with filenames or paths containing spaces.

- **Handle unset variables**: Use parameter expansion to provide default values or handle cases where a variable might be unset.  
  _Example_: `${VARIABLE:-"default"}` will use `"default"` if VARIABLE is unset or null.

- **Export variables when necessary**: If a variable needs to be accessed by other scripts or processes, use `export` to make it an environment variable.

- **Avoid backticks**: Use `$(...)` for command substitution instead of backticks (\` \`), as it allows for nesting and is generally more readable.

- **Use arrays for multiple values**: If you need to store multiple values, use arrays instead of comma-separated strings.  
  _Access using_: `${array[index]}`

- **Be mindful of case sensitivity**: Variable names are case-sensitive, so `myVar` and `myvar` are different variables.

- **Follow naming conventions**: Use lowercase with underscores for variable names (e.g., `my_variable`). Reserve uppercase names for environment variables or constants.

- **Avoid using `eval`**: The `eval` command can be dangerous if not used carefully, as it executes arbitrary code. Avoid it if possible and find alternative solutions.

- **Test for errors**: After assigning a value to a variable, consider testing it to ensure the assignment was successful.

- **Use `readonly` for constants**: If a variable should not be changed after it is initialized, declare it as `readonly`.


```
#!/bin/bash

# Good practices for variable access

# Descriptive variable names
file_path="/path/to/my/file"
user_name="Balaji Reddy"

# Using ${} for clarity
echo "The file is located at: ${file_path}/data.txt"

# Quoting variables
message="Hello, world!"
echo "${message}"

# Handling unset variables If no value assigned to location it use it's default value
echo "Location value: ${location:-"Banglore"}"
location=Hyderbad
echo "Location value: ${location:-"Banglore"}" # Output will be Hyderabad

# Exporting variables
export GLOBAL_VAR="This is global"
# Another script can access $GLOBAL_VAR

# Arrays
tools_list=("DevOps" "AWS" "Java")
echo "First tool: ${tools_list[0]}"

# Readonly variables
readonly CONSTANT_VALUE="Do not change"
# CONSTANT_VALUE="new value" # This would cause an error

```

---
# 🐚 Operators in Shell Scripting
In shell scripting, operators are used to perform various operations like arithmetic, comparison, logical operations, and string manipulations on operands such as variables and values.. Here's a detailed overview of different types of operators in shell scripting with examples:

---

## 📘 Types of Operators

### 1. **Arithmetic Operators**
Used for basic mathematical operations.

| Operator | Description      | Example                 |
|----------|------------------|-------------------------|
| `+`      | Addition          | `echo $((a + b))`       |
| `-`      | Subtraction       | `echo $((a - b))`       |
| `*`      | Multiplication    | `echo $((a * b))`       |
| `/`      | Division          | `echo $((a / b))`       |
| `%`      | Modulus (remainder) | `echo $((a % b))`     |

> Use `$(())` for arithmetic expansion.
#### Example
```
#!/bin/bash

a=10
b=3

echo "Addition: $((a + b))"        # 13
echo "Subtraction: $((a - b))"     # 7
echo "Multiplication: $((a * b))"  # 30
echo "Division: $((a / b))"       # 3 (integer division)
echo "Modulus: $((a % b))"         # 1
echo "Exponent: $((a ** b))"       # 1000
```
---

### 2. **Relational Operators**

Used for comparison between numbers(often used with test command or [ ]).

| Operator | Description           | Example                         |
|----------|-----------------------|---------------------------------|
| `-eq`    | Equal to              | `[ $a -eq $b ]`                 |
| `-ne`    | Not equal to          | `[ $a -ne $b ]`                 |
| `-gt`    | Greater than          | `[ $a -gt $b ]`                 |
| `-lt`    | Less than             | `[ $a -lt $b ]`                 |
| `-ge`    | Greater than or equal | `[ $a -ge $b ]`                 |
| `-le`    | Less than or equal    | `[ $a -le $b ]`                 |

#### Example

```
#!/bin/bash

x=5
y=10

if [ $x -eq $y ]; then echo "Equal"; fi            # -eq
if [ $x -ne $y ]; then echo "Not equal"; fi        # -ne
if [ $x -gt $y ]; then echo "Greater"; fi          # -gt
if [ $x -lt $y ]; then echo "Lesser"; fi           # -lt
if [ $x -ge $y ]; then echo "Greater or equal"; fi  # -ge
if [ $x -le $y ]; then echo "Lesser or equal"; fi  # -le
```
---

### 3. **Boolean / Logical Operators**
Used for logical operations to combine multiple conditions.



| Operator | Description      | Example                       |
|----------|------------------|-------------------------------|
| `!`      | NOT               | `[ ! $a -eq $b ]`             |
| `-o`     | OR                | `[ $a -eq 1 -o $b -eq 2 ]`    |
| `-a`     | AND               | `[ $a -eq 1 -a $b -eq 2 ]`    |
| `||`     | Logical OR        | `[ $a -eq 1 ] || [ $b -eq 2 ]`|
| `&&`     | Logical AND       | `[ $a -eq 1 ] && [ $b -eq 2 ]`|

### Example

```
#!/bin/bash

a=10
b=20

# AND (&& or -a)
if [ $a -lt 20 -a $b -gt 15 ]; then echo "Both true"; fi
if [[ $a -lt 20 && $b -gt 15 ]]; then echo "Both true"; fi

# OR (|| or -o)
if [ $a -lt 5 -o $b -gt 15 ]; then echo "At least one true"; fi
if [[ $a -lt 5 || $b -gt 15 ]]; then echo "At least one true"; fi

# NOT (!)
if [ ! $a -eq 5 ]; then echo "Not equal to 5"; fi
```

---

### 4. **String Operators**
Used for string comparison and checking.

| Operator  | Description                     | Example                        |
|-----------|----------------------------------|--------------------------------|
| `=`       | Equal                            | `[ "$a" = "$b" ]`              |
| `!=`      | Not equal                        | `[ "$a" != "$b" ]`             |
| `-z`      | String is null (zero length)     | `[ -z "$a" ]`                  |
| `-n`      | String is not null               | `[ -n "$a" ]`                  |
| `<`       | Less than (alphabetically)       | `[ "$a" \< "$b" ]`            |
| `>`       | Greater than (alphabetically)    | `[ "$a" \> "$b" ]`            |

> Note: Use `\` to escape `<` or `>` in strings.

### Example

```
#!/bin/bash

str1="Hello"
str2="World"
str3=""

# Comparison
if [[ "$str1" = "$str2" ]]; then echo "Equal"; fi      # =
if [[ "$str1" != "$str2" ]]; then echo "Not equal"; fi  # !=
if [[ "$str1" < "$str2" ]]; then echo "Less"; fi       # < 
if [[ "$str1" > "$str2" ]]; then echo "Greater"; fi    # >

# Check if string is empty
if [ -z "$str3" ]; then echo "Empty"; fi             # -z
if [ -n "$str1" ]; then echo "Not empty"; fi          # -n

str3="$str1 $str2"
echo "Concatenated string: $str3"
length="${#str1}"  # #string_var will give lengh of string value
echo "Length of str1 is $length"
```

---

### 5. **File Test Operators**
Used to test properties of files and directories.

| Operator  | Description                        | Example                        |
|-----------|------------------------------------|--------------------------------|
| `-e`      | File exists                        | `[ -e filename ]`             |
| `-f`      | Regular file                       | `[ -f filename ]`             |
| `-d`      | Directory                          | `[ -d dirname ]`              |
| `-r`      | File is readable                   | `[ -r filename ]`             |
| `-w`      | File is writable                   | `[ -w filename ]`             |
| `-x`      | File is executable                 | `[ -x filename ]`             |
| `-s`      | File is not empty                  | `[ -s filename ]`             |
| `-L`      | File is a symbolic link            | `[ -L symlinkname ]`          |

#### Example
```
#!/bin/bash

file="example.txt"

if [ -e "$file" ]; then echo "Exists"; fi             # -e
if [ -f "$file" ]; then echo "Regular file"; fi       # -f
if [ -d "$file" ]; then echo "Directory"; fi          # -d
if [ -s "$file" ]; then echo "Size > 0"; fi           # -s
if [ -r "$file" ]; then echo "Readable"; fi           # -r
if [ -w "$file" ]; then echo "Writable"; fi           # -w
if [ -x "$file" ]; then echo "Executable"; fi         # -x
```
---

### 6. **Assignment Operator**
Used to assign a value to a variable.

### Example One
```bash
name="Balaji"
count=$((5 + 3))
```

### Example Two
```
#!/bin/bash

a=10
echo "Simple assignment: $a"  # =

# Compound assignments
let "a += 5"  # a = a + 5
echo "Add 5: $a"  # 15

let "a -= 3"  # a = a - 3
echo "Subtract 3: $a"  # 12

let "a *= 2"  # a = a * 2
echo "Multiply by 2: $a"  # 24

let "a /= 4"  # a = a / 4
echo "Divide by 4: $a"  # 6

let "a %= 5"  # a = a % 5
echo "Modulus 5: $a"  # 1
```

---
### 7. **Ternary Operator (Conditional Operator)**
Available in bash version 4.2+.

```
#!/bin/bash

a=10
b=20

# Syntax: condition ? result_if_true : result_if_false
max=$((a > b ? a : b))
echo "The maximum is $max"  # 20
```
---
# 📘 Best Practices While Working with Shell Scripting Operators

Shell scripting operators are powerful tools for performing calculations, comparisons, and logic handling. Following best practices ensures reliability, maintainability, and reduced risk of errors.

---

## 🔧 1. Use `[[ ... ]]` Instead of `[ ... ]` for Conditions (Bash)
- `[[ ... ]]` supports more features (like regex matching) and is safer with unquoted variables.
```bash
# Good
if [[ "$file" == *.txt ]]; then
  echo "Text file"
fi
```

---

## 🧩 2. Always Quote Variables
Avoid word splitting and globbing by quoting variables in test expressions and commands.
```bash
# Bad
if [ $user = "admin" ]; then

# Good
if [ "$user" = "admin" ]; then
```

---

## ➕ 3. Use `$(( ))` for Arithmetic Operations
Avoid `expr`; prefer `(( ))` or `$(( ))` for readability and safety.
```bash
# Good
sum=$((a + b))
((count++))
```

---

## 4. Use `-eq`, `-ne`, `-lt`, `-gt`, `-le`, `-ge` for Integer Comparisons


```bash
# Good
if [ "$count" -eq 5 ]; then
  echo "Count is five"
fi
```

---

## 📏 5. Use `=`, `!=`, `<`, `>` for String Comparisons
- Use `[[ ... ]]` for safe string comparisons involving `<` and `>`.
```bash
if [[ "$str1" = "$str2" ]]; then
  echo "$str1 is equal to $str2"
fi

if [[ "$str1" != "$str2" ]]; then
  echo "$str1 is not equal to $str2"
fi

if [[ "$str1" > "$str2" ]]; then
  echo "$str1 is greate than $str2"
fi

```


---

## 🔗 6. Use Logical Operators Correctly
### Inside `[ ... ]` or `[[ ... ]]`:
```bash
# Logical AND (Bash)
if [[ "$user" = "admin" && "$status" = "active" ]]; then

# Logical OR
if [[ "$size" -gt 100 || "$size" -lt 10 ]]; then
```

---

## 🧪 7. Validate Input Types
Before performing arithmetic or string operations, check the variable type and content.
```bash
if [[ "$age" =~ ^[0-9]+$ ]]; then
  echo "Valid age"
fi
```
---
## 📁 8. Document Complex Expressions
Use inline comments to clarify the logic of compound expressions.
```bash
if [[ "$user" = "admin" && "$access" -eq 1 ]]; then
  # Grant access if user is admin and access flag is set
  grant_access
fi
```
---

## 📌 Example Script Using Various Operators

```bash
#!/bin/bash

a=10
b=20
name="DevOps"

# Arithmetic
echo "Sum: $((a + b))"

# Relational
if [[ $a -lt $b ]]; then
  echo "$a is less than $b"
fi

# String
if [[ "$name" = "DevOps" ]]; then
  echo "Name matched"
fi

# File test
if [[ -f "/etc/passwd" ]]; then
  echo "File exists"
fi
```