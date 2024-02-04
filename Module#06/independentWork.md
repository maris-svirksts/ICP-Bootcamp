# Python: Independent Work within Lecture.

## The Task
1. Find the user and age of a user
2. Compare if the user in your database
3. If the user is existing, you can call by his name
4. Ask his age and you are selling alcohol
5. if the age is below 18, reject him and offer something else
6. If he wanted to leave, say goodbye

## The Result
```python
# Script to interact with users in a client database.
# It checks if the user is in the database, welcomes them, and verifies their age for alcohol purchase eligibility.
# Comments written by ChatGPT, then verified by hand.

def input_loop():
    # Loop to continually prompt the user for age verification
    while True:
        # Retrieve the current user's data
        specific_client = list(client_database[user])

        # Ask the user to verify their age or to quit with 'q'
        age_input = input(f"Can you, please, verify your age? Our records show that you are {specific_client[2]} years old. Write your age, or 'q' to quit, please: ")
        
        # Check if the user wants to exit the loop
        if age_input.lower() == 'q':
            print("Exiting...")
            break

        # Try to convert the input to an integer and check age for alcohol eligibility
        try:
            specific_client[2] = int(age_input)
            client_database[user] = specific_client
            
            # Check if the user is of legal drinking age
            if specific_client[2] >= drinking_age:
                print("Here is the list to our alcoholic and nonalcoholic beverages: <full list>")
            else:
                print(f"I'm sorry, you are below {drinking_age}, may I interest you in some non alcoholic beverages: <non alcoholic list>")
            
            # Print new lines for clear output separation
            print("\n\n")
        except ValueError:
            # Handle invalid numeric input
            print("Invalid input. Please enter a valid age in numbers.")

    return

# Legal drinking age constant
drinking_age = 18

# Client database with users' information
client_database = {
    "john": ("John", "Doe", 21),
    "jane": ("Jane", "Doe", 35),
    "jack": ("Jack", "Daniel", 17),
}

# Prompt user to log in
user = input("Log in, please: ").lower()

# Check if the user exists in the database and interact accordingly
if user in client_database:
    print(f"Hello {client_database[user][0]}, welcome back!")
    input_loop()
else:
    # Handle case where the user is not in the database
    print("I'm sorry, I don't see you in our database. Can you, please, register with us: <link here>")
```