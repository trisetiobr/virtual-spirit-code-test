# virtual-spirit-code-test
This tools to calculating maximum count of same contents of file inside directory

# Description
This project using ruby version 3.1.2.

# Assumption
The output of this system does not display the content of files. Instead, it prints the checksum of each file. This approach is taken because displaying the entire content of potentially large files could lead to performance and usability issues.

# How to Run
```
ruby main.rb {{directory}}
```
for example
```
ruby main.rb ./file_examples
```
output example
```
Files with the same content: 177bb7838ae8c6d9a14cd8f76128f31db8fb4cb93ce5260b2e1021abd9e2571f 4
```