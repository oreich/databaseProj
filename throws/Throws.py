import pandas as pd
from faker import Faker

# Set up Faker to generate realistic fake data
fake = Faker()

# Generate random attributes for each entity
data = []
for i in range(300000):
    throw_type = fake.random_element(elements=('Free Throw', 'Field throw', 'Three Point'))
    style_throw = fake.random_element(elements=(
        'dunk', 'layup', 'jump shot', 'hook', 'alley oop', 'tip in')) if throw_type != 'Free Throw' else 'Free Throw'
    throw_ID = i + 1 + 419999
    time = fake.random_int(min=1, max=48)
    flag = fake.random_int(min=0, max=1)
    score = 0 if flag == 0 else 1 if throw_type == 'Free Throw' else 2 if throw_type == 'Field throw' else 3
    location = fake.random_element(
        elements=('beyond helf court', 'left 3 point line', 'right 3 point line')) if score == 3 \
        else fake.random_element(
        elements=('left inside arc', 'right inside arc', 'left baseline', 'right baseline', 'paint')) \
        if score == 2 else 'foul line'
    thrower_ID = fake.random_int(min=1, max=20000)
    game_ID = fake.random_int(min=1, max=10000)

    data.append(
        {'Throw ID': throw_ID, 'Throw Type': throw_type, 'Location': location, 'Time': time, 'Score': score,
         'Thrower ID': thrower_ID,
         'Game ID': game_ID, 'Style Throw': style_throw})
# Create a pandas DataFrame from the generated data
df = pd.DataFrame(data)
# Write dataframe to CSV file
df.to_csv('throws120001.csv', index=False)

