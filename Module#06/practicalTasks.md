# Python Code Snippets

## Sorting a List
This snippet demonstrates finding the maximum number in a list and various ways to sort the list in descending order to get the maximum value.
numbers = [3, 8, 11, 88, 21]

```python
print(max(numbers))
print(sorted(numbers)[-1])

numbers.sort(reverse=True)
print(numbers[0])
```

## Filtering Numbers Divisible by 3 and 5
Prompts the user for two natural numbers (a and b) and prints numbers in the range [a, b] that are divisible by 3, 5, or both.

```python
def gather_input():
  while True:
    try:
      inputA = int(input("Integer A: "))
      inputB = int(input("Integer B: "))
    except ValueError:
      print("Invalid input. Please enter a positive integer.")
    except:
        print("Something went wrong.")
    else:
      if inputA > 0 and inputB > 0:
        break
      else:
        print("Both values need to be positive.")

  return inputA, inputB

intA, intB = gather_input()

flag = True

for i in range(intA, intB):
  if i % 3 == 0 and i % 5 == 0:
    flag = False
    print(f"{i} is dividable by 3 and 5")
  elif i % 3 == 0:
    print(f"{i} is dividable by 3")
  elif i % 5 == 0:
    print(f"{i} is dividable by 5")

if flag:
  print("Within this range there was no integer that could be divided by 3 and 5 at the same time.")
```

## Printing Specific Natural Numbers
Prints the first `n` natural numbers that are divisible only by 2, 3, and 5, based on user input.

```python
def gather_input():
  while True:
    try:
      varX = int(input("Integer: "))
      if varX > 0:
        break
      else:
        print("Value needs to be positive.")
    except ValueError:
      print("Invalid input. Please enter a positive integer.")

  return varX

n = gather_input()
results = []
number_to_check = 2

while n > len(results):
  if number_to_check % 2 == 0 and number_to_check % 3 == 0 and number_to_check % 5 == 0:
    results.append(number_to_check)
  
  number_to_check += 1

print("Numbers that can be divided only by 2, 3 and 5 at the sme time: " + str(results))
```

## Importing Functions with Identical Filenames
Illustrates how to import and utilize functions from modules with identical filenames but located in different directories.

```python
from init_files.software1 import hello as h1 # Case with identical file names.
from init_files.software2 import * # With __init__.py

h1.sum("a", "b") # Overwriting a builtin function.
print(hello.sum1(1, 3)) # software2 used, filename identical to software1
```