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
    manger_ID = i + 1
    first_name = fake.first_name()
    last_name = fake.last_name()
    team_id = fake.random_int(min=1, max=500)  # it can be that two or more people have the same team id
    age = fake.random_int(min=18, max=80)
    year = random.randint(1946, 2023)
    month = random.randint(1, 11)
    days_in_month = (datetime(year, month+1, 1) - datetime(year, month, 1)).days
    day = random.randint(1, days_in_month)
    start_date = datetime(year, month, day)
    end_date = start_date + timedelta(days=365)

    data.append({'manger_ID': manger_ID,'First Name': first_name, 'Last Name': last_name, 'Team ID': team_id, 'Age': age,
                 'Date': start_date, 'End Date': end_date})

# Create a pandas DataFrame from the generated data
df = pd.DataFrame(data)
# Write dataframe to CSV file
df.to_csv('manger.csv', index=False)

# Write dataframe to TXT file
df.to_csv('manger.txt', index=False, sep='\t')
