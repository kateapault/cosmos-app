# COSMOS

Co-created by Adam Xiao
<br>
<br>
# Summary
What can you make with the booze in your cupboard and the mixers in your fridge? Cosmos can tell you! Logged-in users can post and edit their own cocktail recipes, 'like' others' recipes, and search recipes based on ingredients. Anonymous users can view and search cocktails. 
<br>
<br>
# Ruby v2.6.1, Rails v6.0.2

<br>
<br>

# Configuration
<ol>
<li>Download the repo and <code>$ cd</code> into the directory.</li> 
<li>Run <code>$ bundle install</code> </li>
<li>Run <code>$ rails db:setup</code> to initialize the database and get the seed data</li>
<li>Run <code>$ rails s</code> to start the server. </li>
<li>Open <b>index.html</b> and explore cocktail recipes! 🍸</li>
  </ol>

<br>
<br>

# Under the Hood
The main goal of this app is to provide cocktail recipes using only whatever ingredients you have in your home. That was expanded and searches can also find cocktails containing at least one search ingredient, or cocktails that do not contain any search ingredients.

<br>
<br>

# What's Next?

* Revise code (better naming, make comments more clear, see what I can optimize)
* Create ingredients at the same time as new cocktails
* Revise interface now that I have better CSS skills
* Host on Heroku
* Use an API to pull in cocktail recipes instead of having 100% user-created recipes
* For identical recipes with different names, display both names on a single recipe rather than displaying them as two separate ones
