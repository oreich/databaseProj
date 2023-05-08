import pandas as pd
from faker import Faker

# Set up Faker to generate realistic fake data
fake = Faker()

# Define the number of entities to generate
n = 100

# Generate random attributes for each entity
data = []
for i in range(100000):
    throw_type = fake.random_element(elements=('Free Throw', 'Field throw', 'Three Point', 'missed'))
    style_throw = fake.random_element(elements=(
    'dunk', 'layup', 'jump shot', 'hook', 'alley oop', 'tip in')) if throw_type != 'Free Throw' else 'Free Throw'
    time = fake.random_int(min=1, max=48)
    score = 1 if throw_type == 'Free Throw' else 2 if throw_type == 'Field throw' else 3 if throw_type == 'Three Point' else 0
    location = fake.random_element(
        elements=('beyond helf court', 'left three point line', 'right three point line')) if score == 3 \
        else fake.random_element(
        elements=('left side inside the arc', 'right side inside the arc', 'left baseline', 'right baseline', 'paint'))\
        if score == 2 else 'foul line'
    thrower_ID = fake.random_int(min=1, max=500)
    game_ID = fake.random_int(min=1, max=10000)
    data.append(
        {'Throw Type': throw_type, 'Location': location, 'Time': time, 'Score': score, 'Thrower ID': thrower_ID,
         'Game ID': game_ID, 'Style Throw': style_throw})

# Create a pandas DataFrame from the generated data
df = pd.DataFrame(data)
# Write dataframe to CSV file
df.to_csv('throws.csv', index=False)

# Write dataframe to TXT file
df.to_csv('throws.txt', index=False, sep='\t')
