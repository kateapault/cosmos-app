from urllib import request
import re

url = f"https://en.wikipedia.org/wiki/List_of_cocktails"
result = request.urlopen(url)
binary_data = result.read()
utf8_data = binary_data.decode('utf-8')
text = utf8_data.split('id="See_also"')[0]

def hacky_get_names(text):
    names = []
    li_split = text.split('<li>')
    for section in li_split:
        if "</li>" in section:
            li = section.split('</li>')[0]
            if ">" in li:
                name = li.split('>')[1].split('<')[0]
                if len(name) > 1:
                    names.append(name)
            elif ":" not in li:
                if "(" in li:
                    name = li.split("(")[0].strip()
                    names.append(name)
                else:
                    if len(name) > 1:
                        names.append(li)
    return names

def pull_lis(text):
    lis = []
    chunks = text.split('li')
    for chunk in chunks:
        if chunk[-2:] == "</":
            lis.append(chunk)
    return lis

def get_recipe(name):
    cocktail = name.replace(" ","-").lower()
    url = f"https://www.liquor.com/recipes/{cocktail}/"
    try: 
        result = request.urlopen(url)
        binary_data = result.read()
        data = binary_data.decode('utf-8')
        return data
    except:
        print("something went wrong - this page was not found")

page_text = get_recipe("bourbon old fashioned")
chunk_ingredients = page_text.split('Ingredients')[1].split("Steps")[0].split("\n")
ingredients = []
for chunk in chunk_ingredients:
    if "<" not in chunk:
        ingredients.append(chunk)
        
steps = [] 
chunk_steps = page_text.split("Steps")[1].split("<p>")
for chunk in chunk_steps:
    # print(chunk)
    if "</p>" in chunk:
        steps.append(chunk.split("</p>")[0])
print("ingredients")
print(f"{ingredients}")
print('steps')
print(steps)
# cocktails = hacky_get_names(text)
# yes = 0
# no = 0
# sures = []
# nots = []
# for cocktail in cocktails:
#     if get_recipe(cocktail):
#         yes += 1
#         sures.append(cocktail)
#     else:
#         no += 1
#         nots.append(cocktail)
