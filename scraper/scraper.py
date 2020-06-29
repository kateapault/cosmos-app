from urllib import request
from urllib import error
import sys
import re

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


def liquor_dot_com(page_text):
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
    return ingredients, steps

def format_cocktail_name_for_search(name,symbol="-"):
    return name.replace(" ",symbol).replace("'","").replace("."," ").lower()

def get_recipe(name):
    cocktail = format_cocktail_name_for_search(name)
    url = f"https://www.liquor.com/recipes/{cocktail}/"
    try: 
        result = request.urlopen(url)
        binary_data = result.read()
        data = binary_data.decode('utf-8')
        ingredients, steps = liquor_dot_com(data)
        return {name: {'steps': steps, 'ingredients': ingredients}}
    except:
        print(f"page for {name} was not found")
        return name


def format_ingredients(original_ingredient_string):
    ingredient = {
        'name': '',
        'category': '',
        'amount': '',
        'measurement': ''
    }
    #  Garnish
    if ':' in original_ingredient_string:
        name = original_ingredient_string.split(':')[1].strip()
        if 'rim' in name:
            ingredient['category'] = 'rim'
            ingredient['name'] = name.split('rim')[0].strip().lower()
            ingredient['amount'] = '-'
            ingredient['measurement'] = '-'
        else:
            if 'slice' in name:
                ingredient['name'] = name.split('slice')[0].strip().lower()
                ingredient['measurement'] = 'slice'
            elif 'twist' in name:
                ingredient['name'] = name.split('twist')[0].strip().lower()
                ingredient['measurement'] = 'twist'
            elif 'wheel'in name:
                ingredient['name'] = name.split('wheel')[0].strip().lower()
                ingredient['measurement'] = 'twist'            
            else:
                ingredient['name'] = name.lower()
                ingredient['measurement'] = 'unit'
            ingredient['amount'] = '1'    
            ingredient['category'] = 'garnish'
    else:
        if bool(re.search('\d',original_ingredient_string)):
            if 'oz' in original_ingredient_string:
                amt, name = original_ingredient_string.split('oz')
                ingredient['amount'] = amt.replace(' ','-').strip()
                ingredient['name'] = name.strip().lower()
                ingredient['measurement'] = 'oz'
            elif 'ounce' in original_ingredient_string:
                amt, name = original_ingredient_string.split('ounce')
                ingredient['amount'] = amt.replace(' ','-')
                if name[0] == 's' and name[1] == ' ':
                    name = name[2:]
                ingredient['name'] = name.lower()
                ingredient['measurement'] = 'oz'                
            # elif 'splash'
        for chunk in ingredient_arr:
            pass
            
            
    # if there's a number in there
        # if there's a slash in there
    # oz = ounce

    # if 'garnish'
    
    # if 



#########################################

def main():
    url = f"https://en.wikipedia.org/wiki/List_of_cocktails"
    result = request.urlopen(url)
    binary_data = result.read()
    utf8_data = binary_data.decode('utf-8')
    text = utf8_data.split('id="See_also"')[0]
    cocktails = hacky_get_names(text)

    no_recipe_yet = []
    ingredients = []

    i = 0
    for cocktail in cocktails:
        info = get_recipe(cocktail)
        if type(info) == dict:
            
        else:
            no_recipe_yet.append(info)

