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

##### Solution:
```ruby
# Handles the processing of the extra arguments and later the file
def handle_file
  file_name = ARGV[1]
  puts file_name
  if ARGV.length > 2
    puts ""
    (2...ARGV.length).each do |x|
      service = ARGV[x]
      case service
      when /(\w+)\/(\w+)/
        puts "#{$1}\n  #{$2}"
      else
        puts "#{service}\n  udp\n  tcp"
      end
      puts
    end
  end
end

# Main method which handles the basic ARGV processing
def main()
  if ARGV.length == 0
    puts "No arguments provided..."
    puts "Usage: ruby services.rb -s file_name [service/protocol] ..."

    exit(0)
  elsif ARGV[0] == "-h"
    puts """Usage: ruby services.rb -s file_name [service list]\n
Options:
  -h Prints this message
  -s file_name\tThe name of the service file to extract info from

Arguments:
  service list\tA list of the services and their optional protocol
              \tin the form service/protocol where the protocol can
              \tbe either udp or tcp.
"""
    exit(0)
  elsif ARGV[0] == "-s" and ARGV.length > 1
    handle_file()
  end
end

# Standard Script info to ensure this execution only occurs when run from command line
if __FILE__==$0
	main()
end
```

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

I have completed a large portion of the remaining work, but the code is still unfinished.

### Step 1:
Copy the following code into its own file:

```ruby
# reads each line of the file and checks the line, then rewinds the file
#   service is a string name of the service, i.e., hostnames
#   protocol is a string representing the protocol name, i.e., udp
#   file is a handle to the file
def service_and_protocol service, protocol, file
  flag = false
  file.each do |line|
    flag = flag || checkline(line, service, protocol)
  end

  puts "#{service}/#{protocol}: No such service" unless flag

  file.rewind
end

# Handles the service arguments
#   file is the handle to the file containing the service data
def handle_service_args file
  if ARGV.length > 2
    (2...ARGV.length).each do |x|
      service = ARGV[x]

      # Needs to handle the case of a provided service/protocol or when just a service is provided
    end
  end
end

# Print the contents of the line in the required format
#   service is a string representation of the service name provided by the user
#   srvc is a string representation of the service name from the line
#   port is a string representation of the port number assigned to service
#   proto is a string representation of the protocol
#   aliases is an array of strings naming the aliases
#   comment is a comment trailing the end of the file (including the hash mark)
def print_contents service, srvc, port, proto, aliases, comment
  puts "#{service}/#{proto}: #{port}"
  if aliases.include? service
    puts "#{service}/#{proto}: Alias for #{srvc}"
  end
  if aliases.length > 0
    print "#{service}/#{proto}: "
    if aliases.include? service
      print "Other "
    end
    print "Aliases "
    aliases.each { |a| print "#{a} " unless a == service }
    print "\n"
  end
  if comment != ""
    puts "#{service}/#{proto}: #{comment}"
  end
end

# checks the line for the service and protocol, and extracts the necessary info
def checkline(line, service, protocol)
  if line =~ //
    srvc =
    port =
    proto =
    aliases =
    comment =

    if (srvc == service or aliases.include? service) and proto == protocol
      print_contents(service, srvc, port, proto, aliases, comment)
      return true
    end
    return false
  end
end

# Main function of the script
def main()
  if ARGV.length == 0
    puts "No arguments provided..."
    puts "Usage: ruby services.rb -s file_name [service/protocol] ..."

    exit(0)
  elsif ARGV[0] == "-h"
    puts """Usage: ruby services.rb -s file_name [service list]\n
Options:
  -h Prints this message
  -s file_name\tThe name of the service file to extract info from

Arguments:
  service list\tA list of the services and their optional protocol
              \tin the form service/protocol where the protocol can
              \tbe either udp or tcp.
"""
    exit(0)
  elsif ARGV[0] == "-s" and ARGV.length > 1
    file_name = ARGV[1]
    file = File.open(file_name)

    handle_service_args(file)

    file.close
  end
end

if __FILE__==$0
	main()
end
```

### Step 2. Finish the code
First download the [services.txt file](ruby2/services.txt)

There are two sections that need to be finished in order for this code to work.

1. The logic in handle service args needs to be completed. This code will need to call the method `service_and_protocol` with the appropriate arguments for each of the following two cases:
    1. The user provided a service name and a protocol, use a regular expression to determine this
    2. The user provided only service, in which case both udp and tcp protocols will need to be searched for.

2. Each line of the file is either a viable line of data or commented out completely. We are only concerned with the viable data. So write a regular expression which will extract the following five pieces of data from a line:
    1. Service name
    2. Port number
    3. Protocol
    4. List of Aliases (optional) -> will need to be converted to an array of strings
    5. Comment at end of line (optional)

Use the following examples to help construct the regular expression

Examples of a complete line is:
```
nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
kerberos	88/tcp		kerberos5 krb5 kerberos-sec	# Kerberos v5
kerberos	88/udp		kerberos5 krb5 kerberos-sec	# Kerberos v5
```

Examples of minimal lines are:
```
finger		79/tcp
supdup		95/tcp
```

#### Example Output:
```
isaac@sparqline001 $ ruby services.rb -s services.txt hostnames kerberos5/tcp bob
hostnames/tcp: 101
hostnames/tcp: Aliases hostname
hostnames/tcp: # usually from sri-nic

hostnames/udp: No such service

kerberos5/tcp: 88
kerberos5/tcp: Alias for kerberos
kerberos5/tcp: Other Aliases krb5 kerberos-sec
kerberos5/tcp: # Kerberos v5

bob/tcp: No such service

bob/udp: No such service
```

#### Check Your Learning:

##### Solution:
```ruby
# reads each line of the file and checks the line, then rewinds the file
def service_and_protocol service, protocol, file
  flag = false
  file.each do |line|
    flag = flag || checkline(line, service, protocol)
  end

  puts "#{service}/#{protocol}: No such service" unless flag

  file.rewind
end

# Handles the service arguments
def handle_service_args file
  if ARGV.length > 2
    (2...ARGV.length).each do |x|
      service = ARGV[x]

      if service =~ /(\w+)\/(\w+)/
        service_and_protocol($1, $2, file)
        puts ""
      else
        service_and_protocol(service, "tcp", file)
        puts ""
        service_and_protocol(service, "udp", file)
        puts ""
      end
    end
  end
end

# Print the contents of the line in the required format
def print_contents service, srvc, port, proto, aliases, comment
  puts "#{service}/#{proto}: #{port}"
  if aliases.include? service
    puts "#{service}/#{proto}: Alias for #{srvc}"
  end
  if aliases.length > 0
    print "#{service}/#{proto}: "
    if aliases.include? service
      print "Other "
    end
    print "Aliases "
    aliases.each { |a| print "#{a} " unless a == service }
    print "\n"
  end
  if comment != ""
    puts "#{service}/#{proto}: #{comment}"
  end
end

# checks the line for the service and protocol, and extracts the necessary info
def checkline(line, service, protocol)
  if line =~ /^(\w+)\s+(\d+)\/(\w{3})\s+(.+?)\s+(# .*)?$/
    srvc = $1
    port = $2
    proto = $3
    aliases = $4.split(" ")
    comment = $5

    if (srvc == service or aliases.include? service) and proto == protocol
      print_contents(service, srvc, port, proto, aliases, comment)
      return true
    end
    return false
  end
end

# Main function of the script
def main()
  if ARGV.length == 0
    puts "No arguments provided..."
    puts "Usage: ruby services.rb -s file_name [service/protocol] ..."

    exit(0)
  elsif ARGV[0] == "-h"
    puts """Usage: ruby services.rb -s file_name [service list]\n
Options:
  -h Prints this message
  -s file_name\tThe name of the service file to extract info from

Arguments:
  service list\tA list of the services and their optional protocol
              \tin the form service/protocol where the protocol can
              \tbe either udp or tcp.
"""
    exit(0)
  elsif ARGV[0] == "-s" and ARGV.length > 1
    file_name = ARGV[1]
    file = File.open(file_name)

    handle_service_args(file)

    file.close
  end
end

if __FILE__==$0
	main()
end
```
