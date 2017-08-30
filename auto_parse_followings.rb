require 'watir'
require 'pry' #Rybe REPL
require 'rb-readline' #Ruby IRB
require 'awesome_print' #color in terminal
require_relative 'credentials_anon'

username = $username
password = $password
like_counter = 0

#Open Browser, Navigate login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto 'instagram.com/accounts/login/'

#Navigate for username and password fields, inject info
ap 'Logging in..'
browser.text_field(:name => 'username').set "#{username}"
browser.text_field(:name => 'password').set "#{password}"

#Click login button
browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
ap 'before'
sleep(rand(7..14))
browser.goto 'instagram.com/dmitryfry/'
ap 'after'
sleep(rand(3..7))
browser.links(:class => "_s53mj")[1].click
# browser.goto 'https://www.instagram.com/dmitryfry/following/'
# puts "индекс: 0"
# puts browser.links(:class => "_s53mj")[0].href
# puts browser.links(:class => "_s53mj")[0].text
# puts "индекс: 1"
# puts browser.links(:class => "_s53mj")[1].href
# puts browser.links(:class => "_s53mj")[1].text
# puts "индекс: 2"
# puts browser.links(:class => "_s53mj")[2].href
# puts browser.links(:class => "_s53mj")[2].text
sleep(rand(3..7))

200.times do |i|
  browser.driver.execute_script("document.querySelector('._4gt3b').scrollTop = document.querySelector('._4gt3b').scrollTop + 300")
  sleep(rand(1..4))
end
browser.as(:class => '_4zhc5 notranslate _j7lfh').each do |val|
  filename = 'data.txt'
  file = File.open(filename, 'a')
  file.write("#{val.title}\n")
  file.close
end
