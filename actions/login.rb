require 'pry'
require 'watir'

require_relative '../libs/config.rb'
require_relative '../libs/utils.rb'

=begin

	Logic

=end

def login(user, pass)
	puts '> Navigating to instagram'
	$browser.goto 'https://www.instagram.com/accounts/login/'
	
	puts ""
	fill('username', user)
	fill('password', pass)
	puts ""
	
	focus($browser.button(:class => ['_qv64e','_gexxb', '_4tgw8', '_njrw0']))
	sleep(2)
	
	$browser.goto "https://www.instagram.com/#{user}/"
	sleep(2)
end