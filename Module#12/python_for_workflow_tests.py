# This function adds two numbers and returns the result
def add_numbers(a, b):
    # Calculate the sum of a and b
    result = a + b
    # Return the sum
    return result

# Example usage of the add_numbers function
if __name__ == "__main__":
    num1    = 5
    num2  = 3
    # Call the add_numbers function with num1 and num2
    sum =  add_numbers(num1, num2)
    # Print the result to the console
    print(f"The sum of {num1} and {num2} is {sum}")
