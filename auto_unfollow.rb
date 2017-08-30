require 'watir'
require 'pry' #Rybe REPL
require 'rb-readline' #Ruby IRB
require 'awesome_print' #color in terminal
require_relative 'credentials'

username = $username
password = $password
actions_counter = 0
datafile = File.open "data.txt", "r"
userarray = []

while line = datafile.gets
    userarray << line.strip
end

datafile.close

users = userarray.uniq

#Open Browser, Navigate login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto 'instagram.com/accounts/login/'

#Navigate for username and password fields, inject info
ap 'Logging in..'
browser.text_field(:name => 'username').set "#{username}"
sleep(rand(3..7))
browser.text_field(:name => 'password').set "#{password}"

#Click login button
browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
sleep(rand(4..9))


users.each do |user|
  browser.goto "instagram.com/#{user}/"
  sleep(rand(3..9))
  #if not following then follow
  if browser.button(:class => '_ah57t _84y62 _frcv2 _rmr7s').exists?
    ap "You not follow #{user}"


  elsif browser.button(:class => '_ah57t _6y2ah _frcv2 _rmr7s').exists?
    ap "Unfollowing #{user}"
    browser.button(:class => '_ah57t _6y2ah _frcv2 _rmr7s').click
    actions_counter += 1
  end
  ap "Actions: #{actions_counter}"
  sleep(rand(9..15))
end

#Pry.start(binding)
