# CSCI 305 Programming Languages

## Ruby Part 2

**Reading:** [Ruby Tutorial](https://www.tutorialspoint.com/ruby/index.htm) Sections 6, 8, 9, 19

### Instructions
1. [Watch This Video](https://youtu.be/rURGBVZWpe8) - (19:36)
2. [Watch This Video](https://youtu.be/WZroRTP0JHk) - (27:05)
3. [Watch This Video](https://youtu.be/JnGp5h1pr50) - (09:01)
4. Review the [Tutorial](https://www.tutorialspoint.com/ruby/index.htm)
5. Review the Example Code
6. Complete the Out of Class Exercises
7. Check Your Learning
8. Attend Class and complete the In Class Exercises
9. Check Your Learning

### Code Examples
**Methods**
- [advan01.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/advan01.rb)
- [advan02.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/advan02.rb)
- [advan03.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/advan03.rb)

**Expressions**
- [expr01.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/expr01.rb)
- [expr02.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/expr02.rb)

**I/O**
- [io02.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/io01.rb)
- [io01.rb](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/io01.rb)
- [ordinal](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/ordinal)
- [testfile](https://github.com/CSCI305/csci305-ruby-examples/blob/master/ruby2/testfile)

### Out of Class Exercise
In ruby there is a built-in variable called `ARGV` which is an array containing each of the command line arguments following the script name from the command line. For example if the command line was:
```
$ ruby test.rb This is a test
```
Then `ARGV` will be the array: `["This", "is", "a", "test"]`

Using `ARGV` along with our knowledge of regular expressions, and now I/O operations we will construct a short program to extract information concerning the services running on a system.

The first part of the problem will be to construct the portion of the script which processes the command line arguments, we should expect the following:
* -s file_name -> the -s flag followed by an argument indicating a file name containing UNIX service data
* service\[/proto\] -> a list of service names (with optional protocol (separated by a slash)) where each service/protocol pair is separated by a space
* -h prints the help info

Example: `ruby services.rb -s services.txt kerberos5 hostnames kerberos/tcp auth pop3 ftp`

Should print the following message if no arguments are provided:
```
No arguments provided...

Usage: ruby services.rb -s file_name [service list]
```

Should print the following message if `-h` option provided as first option, don't worry about searching for `-h`, just assume they will use either `-h` or `-s` as the first option
```
Usage: ruby services.rb -s file_name [service list]

Options:
  -h Prints this message
  -s file_name  The name of the service file to extract info from

Arguments:
  service list  A list of the services and their optional protocol
                in the form service/protocol where the protocol can
                be either udp or tcp.
```

For now the `-s` option should simply output the name of the file followed by a list of the services and followed by a line for each protocol:

For example the command `$ ruby services.rb -s services.txt hostnames kerberos5/tcp` should output
```
services.txt

hostnames
  udp
  tcp

kerberos5
  tcp
```

#### Check Your Learning:

##### [Solution Video]() - (:)

##### Solution:

### In Class Exercises
Continuing where we left off with the out-of-class exercise...

We will be working with **[this file](ruby2/services.txt)**

We are going to use the previous code to provide the means to extract meaningful information for a UNIX services file

The structure of such a file is as follows:
```
#
# Example /etc/services lines
#
finger          79/tcp
finger          79/udp
http            80/tcp          www www-http    # WorldWideWeb HTTP
http            80/udp          www www-http    # HyperText Transfer Protocol
kerberos        88/tcp          kerberos5 krb5  # Kerberos v5
kerberos        88/udp          kerberos5 krb5  # Kerberos v5
supdup          95/tcp
supdup          95/udp
hostname        101/tcp         hostnames       # usually from sri-nic
hostname        101/udp         hostnames       # usually from sri-nic
```
The # character denotes a comment. The comment continues to the end of a line. A comment may follow real data on the line. Data on each line is separated by white space. Blank lines are allowed, and are ignored. Each line containing data describes one service. The first field is the standard name for the service, the second describes the port number and the low-level protocol, separated by a slash. Then may appear zero or more additional fields specifying alias names for the same service.

Your script should take a command line of the following form:
```
ruby services.rb [ -s file ] service[/protocol] . . .
```
That is, it should take a list of services, optionally preceded by a specification of file to read. Each service may have an optional protocol, which is tcp or udp. If there is no protocol specified, show information for each protocol which actually occurs in the file.

For each service on the command line, print several lines of output. Place a blank line between the output for each service. Print the following.

If some service is specified on the command line with a protocol as xxx/ppp, and is not in the file, print:
```
xxx/ppp: No such service
```

If a service is requested without a protocol, as xxx. and does not appear with any protocol, print:
```
xxx: No such service
```
For each service which is found, print something of the following form. If a service is specified on the command line without a protocol, print one entry for each protocol found (there will be two at most).
```
xxx/ppp: NNN
xxx/ppp: Alias for yyy
xxx/ppp: [Other] Aliases: ...
xxx/ppp: # ...
```
The first line is printed for any match. The NNN is the port number. The second line is printed only when the name matches an alias rather than a standard name. The yyy is the standard name for the service. The third line shows alias names for the service. If the name on the command line was the standard name, this output line should read "Aliases" and give all the aliases. If there are no aliases, this line should not appear. If the command line name is an alias, this third output line should read "Other Aliases" and show only those aliases other than the one from the command line. If there are no additional aliases, this line should not appear. Finally, the comment line should show the comment at the end of the line where the service is described. If there is no comment, or if the comment contains no non-blank characters other than the leading #, this line should not appear.

**Hints**
The command line parameters are given the Ruby script in a pre-defined array called `ARGV`. If a `-s` option is given, you will see `-s` in `ARGV[0]` and the `file name` in `ARGV[1]`. Before processing service names, see if `ARGV[0]` is `-s`. If so, off the -s and the file name, and record the latter in some appropriate variable. Then you can continue processing from ARGV[0] without worrying about the option.

After dispensing with option, you must essentially compare each command-line item with each line in the file. For this you will need a double loop. You can loop through through each argument (using `while()` or `foreach` or something similar) and scan the file for each one. Alternatively, you can scan through the file once, at each line running through the argument list to see if you have a match. (The latter is more efficient, but the former produces output in the same order as the command line, which seems more natural.) **Open file objects have a rewind method which returns to the start of the file.**

After reading each line, you may want to start by removing the comment and saving it somewhere. The simplest way to decide if a line matches the command-line specification is probably to break the line into fields and examine the fields. You can break it up using split, or by matching it and using $n variables. It is also possible to use the command-line item to build a pattern which will match only lines you want, but be careful about matching the prefix of some actual service name by accident.

#### Check Your Learning:

##### [Solution Video]() - (:)

##### Solution:
