#townhall

require 'rubygems'
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
townhall_urls =[]

def get_townhall_urls(doc,townhall_urls)
  counting = 1
  doc.xpath('//a[contains(@class,"lientxt")]').each do |scrapped_url|
    townhall_name=scrapped_url.text.downcase!.gsub(" ", "-") 
    townhall_url= "http://annuaire-des-mairies.com/95/#{townhall_name}.html"
    townhall_urls.push(townhall_url)
  end
  puts "First step Completed"
  return townhall_urls
end

def get_townhall_email(doc)
  doc.xpath('//main[contains(@class,"page-content")]/section[last()-2]//tbody//tr[last()-1]//td[last()]').each do |scrapped_mail|
  if scrapped_mail.text != "" 
    puts scrapped_mail.text
    else
      puts "### Pas d'Email ###"
  end
end
end


def perform (doc,townhall_urls )
  get_townhall_urls(doc,townhall_urls)
  numbertodo = townhall_urls.length
  numbertodo.times do |n|
    doc = Nokogiri::HTML(URI.open(townhall_urls[n]))
    print "#{n}||"
    get_townhall_email(doc)
  end
end


perform(doc,townhall_urls)

