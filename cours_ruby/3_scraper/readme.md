source: https://www.youtube.com/watch?v=b3CLEUBdWwQ

1. Création

````
touch Gemfile
touch scraper.rb
````

2. ajouter au gemfile

````
source "https://rubygems.org"

gem "httparty"
gem "nokogiri"
gem "byebug"
````

3. install

````
bundle install
````

4. aller à scraper.db et définir les dépendences

````
require "nokogiri"
require "httparty"
require "byebug"
````

5. launch scraper.rb

````
ruby scraper.rb
````

6. buybug

````
variable #appeler une variable
continue # pour relancer le script
exit # pour sortir du script
````