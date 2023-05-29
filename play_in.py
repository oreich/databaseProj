from time import strftime

import pandas as pd
from faker import Faker

# Set up Faker to generate realistic fake data
fake = Faker()

# Define the number of entities to generate
n = 20000

# Generate random attributes for each entity
data = []
import random
from datetime import datetime, timedelta

# Generate a random year between 1900 and 2099


# Create a fake date

# Print the fake date


for i in range(n):
    team_ID = fake.random_int(min=1, max=500)
    player_ID = i + 1
    salary = fake.random_int(min=100000, max=10000000)
    start_year = random.randint(1946, 2023)
    play_in_Id = i + 1

    data.append({'play_in_Id': play_in_Id, 'team_ID': team_ID, 'salary': salary,
                 'start_year': start_year,'player_ID': player_ID })

# Create a pandas DataFrame from the generated data
df = pd.DataFrame(data)
# Write dataframe to CSV file
df.to_csv('play_in.csv', index=False)
