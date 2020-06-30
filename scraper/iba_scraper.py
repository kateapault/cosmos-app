from urllib import request

def get_html(url):
    result = request.urlopen(url)
    binary_data = result.read()
    return binary_data.decode('utf-8')

def get_iba_cocktail_names():
    url = "https://en.wikipedia.org/wiki/List_of_IBA_official_cocktails"
    data = get_html(url)
    
    unforgettables = data.split('mw-headline')[2]
    contemporaries = data.split('mw-headline')[3] 
    new_eras = data.split('mw-headline')[4]

    cocktail_pages = []
    cocktail_names = []
    for section in [unforgettables, contemporaries, new_eras]:
        chopped_list = section.split('<ul>')[1]
        chopped_list_items = chopped_list.split('<li>')
        for item in chopped_list_items:
            if "</a>" in item:
                page_start = item.find('href="') + 6
                page_end = item.find('" title')
                
                name_start = item.find('">') + 2
                name_end = item.find('</a>')
                
                cocktail_pages.append(item[page_start:page_end])
                cocktail_names.append(item[name_start:name_end])
    return cocktail_names, cocktail_pages    
    
    

def main():
    cocktail_names, cocktail_pages = get_iba_cocktail_names()

    # for each cocktail, pull ingredients and preparation    
    for page in cocktail_pages:
        url = f"https://en.wikipedia.org{page}"
        data = get_html(url)
        

    
    # convert cl to oz?
    # for all ingredients, add to set?
    
if __name__ == '__main__':
    main()