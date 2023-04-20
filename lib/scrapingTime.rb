#it's_scrapping_time
require 'rubygems'
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
crypto_values = []
crypto_names =[]

#//Scrap the name of the 20 first crypto///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

def name_scrapping(doc,crypto_names)
  counting = 1
  doc.xpath('//*[@class="cmc-table__column-name--name cmc-link"]').each do |scrapped_names|
    puts "#{counting}//scrapped #{scrapped_names.text}"
    crypto_names.push(scrapped_names.text)
    counting = counting +1
  end
  return crypto_names
end

#//Scrap the name of the 21 to 200 crypto (thx antiscrapping :) )/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

def name_scrapping_more(doc,crypto_names)
  counting = 21
  doc.xpath('//*[@class="name-cell"]/a').each do |scrapped_names|
    puts "#{counting}//scrapped #{scrapped_names.text}"
    crypto_names.push(scrapped_names.text)
    counting = counting +1
  end
  return crypto_names
end

#//Scrap the value of the 20 first crypto///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

def values_scrapping(doc,crypto_values)
  counting = 1
  doc.xpath('//*[@class="sc-cadad039-0 clgqXO"]/*[@class="cmc-link"]/span').each do |scrapped_values|
    puts "#{counting}//scrapped #{scrapped_values.text}"
    crypto_values.push(scrapped_values.text)
    counting = counting +1
  end
  return crypto_values
end

#//Menu Time/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
def deco
  puts "#"*40
end
def menu(doc,crypto_names,crypto_values)
  user_choice = 0
  #while user_choise !=3
     puts "que voulez vous faire ô puissant maître ?"
     puts "  1.voir les noms des 200 crypto"
     puts "  2.voir les noms et valeurs des 20 premières"
     print ">"
     user_choice=gets.chomp.to_i
     puts user_choice
     if user_choice == 1
       puts "option 1"
       name_scrapping(doc,crypto_names)
       name_scrapping_more(doc,crypto_names)
     end
     if user_choice== 2
       puts "option 2"
       name_scrapping(doc,crypto_names)
       deco
       values_scrapping(doc,crypto_values)
       deco
       crypto_data= crypto_names.zip(crypto_values)
       puts crypto_data
     end
end


menu(doc,crypto_names,crypto_values)


