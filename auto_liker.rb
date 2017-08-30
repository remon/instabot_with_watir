require 'watir'
require 'pry' #Rybe REPL
require 'rb-readline' #Ruby IRB
require 'awesome_print' #color in terminal
require_relative 'credentials'

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
sleep(2)
5.times do
  3.times do |i|
    browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
    sleep(rand(1..4))
  end

  if browser.span(:class => 'coreSpriteHeartOpen').exists?
    browser.spans(:class => 'coreSpriteHeartOpen').each do |val|
      val.click
      like_counter += 1
      sleep(rand(1..10))
    end
    ap "Photos liked: #{like_counter}"
  else
    ap 'no media to like rigth now'
  end
end
