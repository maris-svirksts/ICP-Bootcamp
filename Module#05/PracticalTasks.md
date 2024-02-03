
# Bash Scripts Collection

This document includes a collection of bash scripts for various tasks, along with instructions on how to call them.

## Script 1: Basic File Operations

Create and modify a file, then copy it to a new location.

```bash
#!/bin/bash
touch $1
echo "This is a test" >> $1
cat $1

cp -r $1 $2
```

**How to Call**: `./script1.sh originalfile.txt copyfile.txt`

## Script 2: Sum of Two Numbers

Check if the sum of two numbers is greater than 50.

```bash
#!/bin/bash
if (( $1 + $2  > 50 )); then
        echo "Pass"
else
        echo "Fail"
fi
```

**How to Call**: `./script2.sh 25 30`

## Script 3: Sum and Evaluation of Three Numbers

Evaluate the sum of three numbers for grading.

```bash
#!/bin/bash

sum=$(( $1 + $2 + $3 ))

if [ $sum -gt 90 ]; then
        echo "Excellent"
elif [ $sum -gt 75 ]; then
        echo "Above Average"
elif [ $sum -gt 50 ]; then
        echo "Average"
else
        echo "Try Again, Please"
fi
```

**How to Call**: `./script3.sh 30 25 20`

## Script 4: Sum of Exactly Two Numbers

Calculate the sum of exactly two numbers.

```bash
#!/bin/bash

if [ $# -eq 2 ]; then
        sum=$(( $1 + $2 ))
        echo $sum
else
        echo "Problem, please, use exactly 2 arguments"
fi
```

**How to Call**: `./script4.sh 15 35`

## Script 5: Conditional Execution Based on Argument Count

Execute different scripts based on the number of arguments.

```bash
#!/bin/bash

if [ $# -eq 2 ]; then
        ./script4.sh $1 $2
elif [ $# -eq 3 ]; then
        ./script3.sh $1 $2 $3
fi
```

**How to Call**: `./script5.sh 10 20` or `./script5.sh 10 20 30`

## Script 6: Case Statement Example

Display text based on the input argument.

```bash
#!/bin/bash

case "$1" in
        1)
                echo "First"
                ;;
        2)
                echo "Two"
                ;;
        3)
                echo "Three"
                ;;
        *)
                echo $1
                ;;
esac
```

**How to Call**: `./script6.sh 2`

## Script 7: Iterate Over Files in a Directory

Print all files within a specified directory.

```bash
#!/bin/bash

for file in $(find "$1" -type f); do
        echo "$file"
done
```

**How to Call**: `./script7.sh /path/to/directory`

## Script 8: Print Numbers 1 to 4

Print numbers from 1 to 4.

```bash
#!/bin/bash

for i in 1 2 3 4; do
        echo $i;
done
```

**How to Call**: `./script8.sh`

## Script 9: Generate and Display a Sequence of Numbers

Generate a sequence from 1 to 10 and display each number.

```bash
#!/bin/bash

for NUMB in $(seq 1 1 10); do echo $NUMB; done
```

**How to Call**: `./script9.sh`

## Additional Information
- I leveraged ChatGPT-4 to enhance the appearance and feel of the .md file. The underlying commands and logic were crafted by me or found on internet and tweaked to fit my needs.
