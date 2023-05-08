import pandas as pd
from faker import Faker

# Set up Faker to generate realistic fake data
fake = Faker()

# Define the number of entities to generate
n = 20000

# Generate random attributes for each entity
data = []
for i in range(n):
    first_name = fake.first_name()
    last_name = fake.last_name()
    team_id = fake.random_int(min=1, max=500) # it can be that two or more people have the same team id
    age = fake.random_int(min=18, max=80)

    data.append({'First Name': first_name, 'Last Name': last_name, 'Team ID': team_id, 'Age': age})


# Create a pandas DataFrame from the generated data
df = pd.DataFrame(data)
# Write dataframe to CSV file
df.to_csv('manger.csv', index=False)

# Write dataframe to TXT file
df.to_csv('manger.txt', index=False, sep='\t')



