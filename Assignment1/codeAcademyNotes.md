> copying files around 

cp biopic/cleopatra.txt historical/ 

cp biopic/ray.txt biopic/notorious.txt historical/ 

---



* cp * folder/

copy the current file(all files in the current wd) into the folder/

---

>  **wildcard functions**

* cp m*.txt scifi/

copy al the files with prefix name m

* mv superman.txt superhero/ 

move files around

* mv batman.txt spiderman.txt 

file renames

---

* rm 
* rm -r
* rm -rf 
* rm -i
* rm foldre/* --> remove all the files in one directory

---

> stdin; stdout; stderr; 

 cat oceans.txt > continents.txt

 cat oceans.txt >> continents.txt 

* both files are cp into the 2nd parameter text;  **Append** Operation >> 

* cat < lake.txt

* cat volcanoes.txt | wc 

  (wc: word count.

  cat volcanoes.txt | wc | cat > islands.txt)

meaning:  "|" --> pipe; 

`|` is a “pipe”. The `|` takes the standard output of the command on the left, and *pipes* it as standard input to the command on the right. You can think of this as “command to command” redirection.



* sort 

  `sort` takes the standard input and orders it alphabetically for the standard output. Here, the lakes in `sort lakes.txt` are listed in alphabetical order.



---

# uniq



`uniq` stands for “unique” and filters out adjacent, duplicate lines in a file. Here `uniq deserts.txt` filters out duplicates of “Sahara Desert”, because the duplicate of ‘Sahara Desert’ directly follows the previous instance. The “Kalahari Desert” duplicates are not adjacent, and thus remain

* ```bash
  sort desert.txt | uniq
  ```

  A more effective way to call `uniq` is to call `sort` to alphabetize a file, and “pipe” the standard output to `uniq`. Here by piping `sort deserts.txt` to `uniq`, all duplicate lines are alphabetized (and thereby made adjacent) and filtered out.

  ```bash
  sort deserts.txt | uniq > uniq_desert.txt
  ```

  Here we simply send filtered contents to **uniq-deserts.txt**, which you can view with the `cat` command.

---

# grep I

```bash
grep Mount mountains.txt
```

`grep` stands for “global regular expression print”. It searches files for lines that match a pattern and returns the results. It is also case <u>*sensitive*</u>. Here, `grep` searches for “Mount” in **mountains.txt**.

```bash
grep -i Mount mountains.txt
```

`grep -i` enables the command to be case insensitive. Here, `grep` searches for capital or lowercase strings that match `Mount`in **mountains.txt**.

The above commands are a great way to get started with `grep`. If you are familiar with regular expressions, you can use regular expressions to search for patterns in files.

# grep II

```bash
grep -R Arctic /home/ccursurs/workspace/geography
```

`grep -R` searches all files in a directory and outputs filenames and lines containing matched results. `-R` stands for “recursive”. Here `grep -R` searches the **/home/ccuser/workspace/geography** directory for the string “Arctic” and outputs filenames and lines with matched results.

```bash
grep -Rl Arctic /home/ccusr/workspace/geography
```

`grep -Rl` searches all files in a directory and outputs only filenames with matched results. `-R` stands for “recursive” and `l`stands for “files with matches”. Here `grep -Rl` searches the **/home/ccuser/workspace/geography** directory for the string “Arctic” and outputs filenames with matched results.



---

# sed

```bash
sed 's/snow/rain' forests.txt
```

`sed` stands for “stream editor”. It accepts standard input and modifies it based on an *expression*, before displaying it as output data. It is similar to “find and replace”.

Let’s look at the expression `'s/snow/rain/'`:

- `s`: stands for “substitution”. it is *always* used when using `sed` for substitution.
- `snow`: the search string, the text to find.
- `rain`: the replacement string, the text to add in place.

In this case, `sed` searches **forests.txt** for the word “snow” and replaces it with “rain.” Importantly, the above command will only replace the first instance of “snow” on a line.

```bash
sed 's/snow/rain/g' forest.txt 
```

The above command uses the `g` expression, meaning “global”. Here `sed` searches **forests.txt** for the word “snow” and replaces it with “rain”, *globally*. All instances of “snow” on a line will be turned to “rain”.



**Notes here:**  with no `/g` , the sed  s/ will only replace the first instance of occurance.

---

# Generalizations

Congratulations! You learned how to use the command line to redirect standard input and standard output. What can we generalize so far?

- *Redirection* reroutes standard input, standard output, and standard error.
- The common redirection commands are:
  - `>` redirects standard output of a command to a file, overwriting previous content.
  - `>>` redirects standard output of a command to a file, appending new content to old content.
  - `<` redirects standard input to a command.
  - `|` redirects standard output of a command to another command.
- A number of other commands are powerful when combined with redirection commands:
  - `sort`: sorts lines of text alphabetically.
  - `uniq`: filters duplicate, adjacent lines of text.
  - `grep`: searches for a text pattern and outputs it.
  - `sed` : searches for a text pattern, modifies it, and outputs it.

---

# Tasks.1

> Redirect the standard output of **basketball.txt** into **hockey.txt**. Then view the contents of **hockey.txt**.

using ">"

> Append the contents of **lacrosse.txt** to the contents of **tennis.txt**. Then, view the contents of **tennis.txt**.

using the ">>" for appending



---

# Task.2 



```bash
wc -l < plants.txt
```

---

# Quiz 

The **uniq** only remove the duplictes onlt if they are adjancent

---

# Environemnt Configure

# nano

Nice. You just edited a file in the nano text editor. How does it work?

```bash
nano hello.txt
```

*nano* is a command line text editor. It works just like a desktop text editor like TextEdit or Notepad, except that it is accessible from the command line and only accepts keyboard input.

1. The command `nano hello.txt` opens a new text file named **hello.txt** in the nano text editor.
2. `"Hello, I am nano"` is a text string entered in nano through the cursor.
3. The menu of keyboard commands at the bottom of the window allow us to save changes to **hello.txt** and exit nano. The `^` stands for the `Ctrl` key.

- `Ctrl` + `O` saves a file. ‘O’ stands for output.
- `Ctrl` + `X` exits the nano program. ‘X’ stands for exit.
- `Ctrl` + `G` opens a help menu.
- `clear` clears the terminal window, moving the command prompt to the top of the screen.

In this lesson, we’ll use nano to implement changes to the environment. You can learn more about nano [here](http://www.nano-editor.org/).

---

# Bash Profile

You created a file in nano called **~/.bash_profile** and added a greeting. How does this work?

```bash
nano ~/.bash_profile
```

**~/.bash_profile** is the name of file used to store environment settings. It is commonly called the “bash profile”. When a session starts, it will load the contents of the bash profile before executing commands.

- The `~` represents the user’s home directory.
- The `.` indicates a hidden file.
- The name **~/.bash_profile** is important, since this is how the command line recognizes the bash profile.

1. The command `nano ~/.bash_profile` opens up **~/.bash_profile** in nano.
2. The text `echo "Welcome, Jane Doe"` creates a greeting in the bash profile, which is saved. It tells the command line to `echo` the string “Welcome, Jane Doe” when a terminal session begins.
3. The command `source ~/.bash_profile` activates the changes in **~/.bash_profile** for the current session. Instead of closing the terminal and needing to start a new session, `source` makes the changes available right away in the session we are in.

---

# Aliases I

What happens when you store this alias in **~/.bash_profile**?

```bash
alias pd="pwd"
```

The `alias` command allows you to create keyboard shortcuts, or aliases, for commonly used commands.

1. Here `alias pd="pwd"` creates the alias `pd` for the `pwd`command, which is then saved in the bash profile. Each time you enter `pd`, the output will be the same as the `pwd`command.
2. The command `source ~/.bash_profile` makes the alias `pd`available in the current session.

Each time we open up the terminal, we can use the `pd` alias.

# Aliases II

What happens when you store the following aliases in **~/.bash_profile**?

```bash
alias hy="history"
```

`hy` is set as alias for the `history` command in the bash profile. The alias is then made available in the current session through `source`. By typing `hy`, the command line outputs a history of commands that were entered in the current session.

```bash
alias ll="ls -la"
```

`ll` is set as an alias for `ls -la` and made available in the current session through `source`. By typing `ll`, the command line now outputs all contents and directories in long format, including all hidden files.

---

# Environment Variables

## USER

What happens when you store this in **~/.bash_profile**?

```bash
export USER="Jane Doe"
```

*environment variables* are variables that can be used across commands and programs and hold information about the environment.

1. The line `USER="Jane Doe"` sets the environment variable USER to a name “Jane Doe”. Usually the USER variable is set to the name of the computer’s owner.
2. The line `export` makes the variable to be available to all child sessions initiated from the session you are in. This is a way to make the variable persist across programs.
3. At the command line, the command `echo $USER` returns the value of the variable. Note that `$` is always used when returning a variable’s value. Here, the command `echo $USER`returns the name set for the variable.

# PS1

What happens when this is stored in **~/.bash_profile**?

```bash
export PS1=">> "
```

`PS1` is a variable that defines the makeup and style of the command prompt.

1. `export PS1=">> "` sets the command prompt variable and exports the variable. Here we change the default command prompt from `$` to `>>`.
2. After using the `source` command, the command line displays the new command prompt.

# HOME

What happens when you type this command?

```bash
echo $HOME
```

The `HOME` variable is an environment variable that displays the path of the home directory. Here by typing `echo $HOME`, the terminal displays the path **/home/ccuser** as output.

You can customize the HOME variable if needed, but in most cases this is not necessary.

# PATH

What happens when you type this command?

```bash
echo $PATH
```

`PATH` is an environment variable that stores a list of directories separated by a colon. Looking carefully, `echo $PATH` lists the following directories:

1. /home/ccuser/.gem/ruby/2.0.0/bin
2. /usr/local/sbin
3. /usr/local/bin
4. /usr/bin
5. /usr/sbin
6. /sbin
7. /bin

Each directory contains scripts for the command line to execute. The `PATH` variable simply lists which directories contain scripts.

For example, many commands we’ve learned are scripts stored in the **/bin** directory.

```bash
/bin/pwd
```

This is the script that is executed when you type the `pwd`command.

```bash
/bin/ls
```

This is the script that is executed when you type the `ls`command.

In advanced cases, you can customize the PATH variable when adding scripts of your own.

# env

What happens when you type this command?

```bash
env
```

The `env` command stands for “environment”, and returns a list of the environment variables for the current user. Here, the `env`command returns a number of variables, including `PATH`, `PWD`, `PS1`, and `HOME`.

```bash
env | grep PATH
```

`env | grep PATH` is a command that displays the value of a single environment variable. Here the standard output of `env` is “piped” to the `grep` command. `grep` searches for the value of the variable `PATH` and outputs it to the terminal.

---

# Generalizations

Congratulations! You learned to use the bash profile to configure the environment. What can we generalize so far?

- The *environment* refers to the preferences and settings of the current user.
- The *nano* editor is a command line text editor used to configure the environment.
- **~/.bash_profile** is where environment settings are stored. You can edit this file with nano.
- *environment variables* are variables that can be used across commands and programs and hold information about the environment.
  - `export VARIABLE="Value"` sets and exports an environment variable.
  - `USER` is the name of the current user.
  - `PS1` is the command prompt.
  - `HOME` is the home directory. It is usually not customized.
  - `PATH` returns a colon separated list of file paths. It is customized in advanced cases.
  - `env` returns a list of environment variables.

---

#Less & LESS
Type the `less` command, with the filename **javanese.txt**. After you do this, type `q` to quit.

The `less` command is similar to `cat`, but is better adapted to handling larger files. It displays files in the terminal one page at a time.




The `less` command is a special command that we can configure in the bash profile through the `LESS`environment variable.

```bash
export LESS="-N"
```



Open the bash profile, and create and export a new environment variable called `LESS`, setting it equal to the option `"-N"`. The `-N` option adds line numbers to the file.

Save the bash profile, exit nano, and clear the terminal window.



----

# Introduction to Bash Scripting

Bash (or shell) scripting is a great way to automate repetitive tasks and can save you a ton of time as a developer. Bash scripts execute within a Bash shell interpreter terminal. Any command you can run in your terminal can be run in a Bash script. When you have a command or set of commands that you will be using frequently, consider writing a Bash script to perform it.

There are some conventions to follow to ensure that your computer is able to find and execute your Bash scripts. The beginning of your script file should start with `#!/bin/bash` on its own line. This tells the computer which type of interpreter to use for the script. When saving the script file, it is good practice to place commonly used scripts in the `~/bin/` directory.

The script files also need to have the “execute” permission to allow them to be run. To add this permission to a file with filename: `script.sh` use:

```bash
chmod +x script.sh
```

Your terminal runs a file every time it is opened to load its configuration. On Linux style shells, this is `~/.bashrc` and on OSX, this is `~/.bash_profile`. To ensure that scripts in `~/bin/`are available, you must add this directory to your `PATH` within your configuration file:

- `PATH=~/bin:$PATH`

Now any scripts in the `~/bin` directory can be run from anywhere by typing the filename

## code Example

```

```



```sh
#!/bin/bash
echo "Hello Codecademy!"
```

```bash
./script.sh
```



---

# Variables

Within bash scripts (or the terminal for that matter), variables are declared by setting the variable name equal to another value. For example, to set the variable `greeting` to “Hello”, you would use the following syntax:

```sh
greeting="Hello"
```

Note that there is no space between the variable name, the equals sign, or “Hello”.

To access the value of a variable, we use the variable name prepended with a dollar sign (`$`). In the previous example, if we want to print the variable value to the screen, we use the following syntax:

```bash
echo $greeting
```



```sh
#!/bin/bash
phrase="Hello to you!"
echo $phrase
```

```bash
./script.sh
```

---

# Conditionals

When bash scripting, you can use conditionals to control which set of commands within the script run. Use `if` to start the conditional, followed by the condition in square brackets (`[ ]`). `then` begins the code that will run if the condition is met. `else`begins the code that will run if the condition is not met. Lastly, the conditional is closed with a backwards `if`, `fi`.

A complete conditional in a bash script uses the following syntax:

```sh
if [$index -lt 5]
then 
	echo $index
else
	echo 5
fi
```

Bash scripts use a specific list of operators for comparison. Here we used `-lt` which is “less than”. The result of this conditional is that if `$index` is less than 5, it will print to the screen. If it is 5 or greater, “5” will be printed to the screen.

Here is the list of comparison operators for numbers you can use within bash scripts:

- Equal: `-eq`
- Not equal: `-ne`
- Less than or equal: `-le`
- Less than: `-lt`
- Greater than or equal: `-ge`
- Greater than: `-gt`
- Is null: `-z`

When comparing strings, it is best practice to put the variable into quotes (`"`). This prevents errors if the variable is null or contains spaces. The common operators for comparing strings are:

- Equal: `==`
- Not equal: `!=`

For example, to compare if the variables `foo` and `bar` contain the same string:

```sh
if ["foo" == "$bar"]
```



# example

```sh 
#!/bin/bash
first_greeting="Nice to meet you!"
later_greeting="How are you?"
greeting_occasion=1
if [ $greeting_occasion -lt 1 ]
then 
	echo $first_greeting
else
	echo $later_greeting
fi
```

---

# Loops

There are 3 different ways to loop within a bash script: `for`, `while` and `until`.

A for loop is used to iterate through a list and execute an action at each step. For example, if we had a list of words stored in a variable `paragraph`, we could use the following syntax to print each one:

```sh
for word in $paragraph
do 
	echo $word
done
```

Note that `word` is being “defined” at the top of the for loop so there is no `$` prepended. Remember that we prepend the `$`when accessing the value of the variable. So, when accessing the variable within the `do` block, we use `$word` as usual.

Within bash scripting `until` and `while` are very similar. `while`loops keep looping while the provided condition is true whereas `until` loops loop until the condition is true. Conditions are established the same way as they are within an `if` block, between square brackets. If we want to print the `index` variable as long as it is less than 5, we would use the following `while`loop:

```sh 
while [$index -lt 5]
do 
	echo $index
	index=$((index + 1))
done
```



Note that arithmetic in bash scripting uses the `$((...))` syntax and within the brackets the variable name is not prepended with a `$`.

The same loop could also be written as an `until` loop as follows:

```sh
until [$index -eq 5]
do 
	echo $index
	index=$((index + 1))
done
```



# loop Example

```sh
#!/bin/bash
first_greeting="Nice to meet you!"
later_greeting="How are you?"
greeting_occasion=0

while [ $greeting_occasion -lt 3 ]
do
  if [ $greeting_occasion -lt 1 ]
  then
    echo $first_greeting
  else
    echo $later_greeting
  fi
  greeting_occasion=$((greeting_occasion + 1))
done
```

---

# Inputs

To make bash scripts more useful, we need to be able to access data external to the bash script file itself. The first way to do this is by prompting the user for input. For this, we use the `read`syntax. To ask the user for input and save it to the `number`variable, we would use the following code:

```sh
echo "guess an numeber"
read number
echo "you guessed $number"
```

Another way to access external data is to have the user add input arguments when they run your script. These arguments are entered after the script name and are separated by spaces. For example:

```sh
saycolors red green blue
```

Within the script, these are accessed using `$1`, `$2`, etc, where `$1` is the first argument (here, “red”) and so on. Note that these are 1 indexed.

If your script needs to accept an indefinite number of input arguments, you can iterate over them using the `"$@"` syntax. For our `saycolors` example, we could print each color using:

```sh
for color in "$@"
do 
	echo $color
done
```

Lastly, we can access external files to our script. You can assign a set of files to a variable name using standard bash pattern matching using regular expressions. For example, to get all files in a directory, you can use the `*` character:

```sh
files=/some/directory/*
```

You can then iterate through each file and do something. Here, lets just print the full path and filename:

```sh
for file in $files
do 
	echo $file 
done

```

# Exercise

```sh
#!/bin/bash
first_greeting="Nice to meet you!"
later_greeting="How are you?"
greeting_occasion=0
greeting_limit=$1
while [ $greeting_occasion -lt $greeting_limit ]
do
  if [ $greeting_occasion -lt 1 ]
  then
    echo $first_greeting
  else
    echo $later_greeting
  fi
  greeting_occasion=$((greeting_occasion + 1))
done
```

---

# Aliases

You can set up aliases for your bash scripts within your `.bashrc`or `.bash_profile` file to allow calling your scripts without the full filename. For example, if we have our `saycolors.sh` script, we can alias it to the word `saycolors` using the following syntax:

```sh
alias saycolors='./saycolors.sh'
```

You can even add standard input arguments to your alias. For example, if we always want “green” to be included as the first input to `saycolors`, we could modify our alias to:

```sh
alias saycolors='./saycolors.sh "green"'
```





#Exercise

Our script is updated to take an argument for the number of times the user wants to be greeted:

```sh
./script.sh 5 #greets 5 times
```

Let’s create an alias so that when you type `greet3` in the terminal, our script greets you three times.

In your own environment, you could add this alias to your **~/.bashrc** to make the alias active every time the terminal is started.

Here, just make the alias in the command line.



Hint

Your command should look like the following:

```bash
alias greet3="./script.sh 3"
```



---

# Review



Take a minute to review what you’ve learned about bash scripting.

- Any command that can be run in the terminal can be run in a bash script.
- Variables are assigned using an equals sign with no space (`greeting="hello"`).
- Variables are accessed using a dollar sign (`echo $greeting`).
- Conditionals use `if`, `then`, `else`, `fi` syntax.
- Three types of loops can be used: `for`, `while`, and `until`.
- Bash scripts use a unique set of comparison operators:
  - Equal: `-eq`
  - Not equal: `-ne`
  - Less than or equal: `-le`
  - Less than: `-lt`
  - Greater than or equal: `-ge`
  - Greater than: `-gt`
  - Is null: `-z`
- Input arguments can be passed to a bash script after the script name, separated by spaces (myScript.sh “hello” “how are you”).
- Input can be requested from the script user with the `read`keyword.
- Aliases can be created in the `.bashrc` or `.bash_profile`using the `alias` keyword.

Instructions

Our completed script is in the code editor. Feel free to edit it to make it your own.

Some ideas:

- ask the user for different greetings
- add more than two greetings
- add more conditions to adjust the greetings over time

---

# Build a Build Script

One common use of bash scripts is for releasing a “build” of your source code. Sometimes your private source code may contain developer resources or private information that you don’t want to release in the published version.

In this project, you’ll create a release script to copy certain files from a **source** directory into a **build** directory.



Tasks

Mark the tasks as complete by checking them off

### Start the script



**1.**

Take a look at the **build** and **source** folders. The objective of our script is to files from **source** to **build**, with a couple of exceptions and modifications.

Get started on the script by adding a header to **script.sh**, identifying the type of script.

Hint

Start the script with:

```
#!/bin/bash
```



**2.**

Let’s welcome the user to the script. Feel free to use your own style here.

Make sure to save your script. Test your script in the terminal using `./script.sh`.

Stuck? Get a hint



**3.**

Since we are creating a new build, let’s verify with the user that they have updated **changelog.md** with the current release version.

The first line of the file contains a version number with markdown formatting like so:

```
## 1.1.1
```

Read the first line of this file into a variable `firstline`. You can use the linux command [head](http://www.linfo.org/head.html) for this purpose.

Stuck? Get a hint



**4.**

We want just the version number without the markdown formatting. The command [read](http://linuxcommand.org/lc3_man_pages/readh.html) can be used to split a string into an array using the `-a` argument.

Split the string `firstline` into the array `splitfirstline`.

The syntax for splitting a string `foo` into an array `bar`is:

```
read -a bar <<< $foo
```

Stuck? Get a hint



**5.**

Now we are ready to set the value of the version of the script. It is located in index `1` of the array `splitfirstline`.

The syntax for accessing the value at `index` of an array `foo` is:

```
${foo[index]}
```

Save the version to a variable, `version`.

Print a statement to the terminal notifying the user of the version they are building.

Stuck? Get a hint

### User Input



**6.**

Let’s give the user a chance to exit the script if they need to make a change to the version.

Ask the user to enter “1” (for yes) to continue and “0” (for no) to exit.

Assign their response to the variable `versioncontinue`.

Stuck? Get a hint



**7.**

Add a conditional. If the user said “1” to the continue question, we will execute the rest of our script. For now, respond “OK”.

If the user did not, tell them “Please come back when you are ready”.

Stuck? Get a hint

### Copying files



**8.**

Now we want to copy every file from **source** to **build**except for **secretinfo.md**.

Within the positive conditional (where we told the user “OK”), start by iterating over all the files in the **source**directory and printing their names to the terminal.

Stuck? Get a hint



**9.**

Check if the `filename` is “source/secretinfo.md”. If it is, inform the user that it is not being copied.

Otherwise, inform the user that it is being copied.

Make sure to use spaces in your string conditional.

Stuck? Get a hint



**10.**

Now we can actually copy the files. After informing the user the file is being copied, copy the file into the `build` directory.

You can use the terminal to make sure the right files have been copied:

```
ls build/
```

Stuck? Get a hint

### Listing files



**11.**

The final thing we want to do is list the files in the **build**directory for the user.

Outside of the loop over the filenames in the directory, use the script to change the directory to the build directory. So that we don’t forget, also add the command to change back to the directory with the script.

Stuck? Get a hint



**12.**

Add code to notify the user what files are currently in the build directory.

Be sure to reference the version in your message.

Stuck? Get a hint



**13.**

You now have a build script for this repository. Feel free to play around with making it more robust. Some ideas:

- Copy **secretinfo.md** but replace “42” with “XX”.
- Zip the resulting **build** directory.
- Give the script more character with emojis.
- If you are familiar with `git`, commit the changes in the build directory.