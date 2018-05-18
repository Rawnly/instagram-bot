require 'pry'
require 'watir'

require_relative '../libs/config.rb'
require_relative '../libs/utils.rb'

=begin

	Logic

=end

def unfollowSome
	followingCount = $browser.link(:href => '/motoimbecilli/following/')
	followingCount.click
	wait(2)

	fcount = Integer(followingCount.text.chars.select do |char|
		/\d+/ =~ char
	end.join(''))

	puts "--------"
	puts "> You are following #{fcount} <"
	puts "--------"

	# Get following users
	$following = getFollowing()

	# Scroll until found people to unfollow
	while $following.count < 1
		focus($browser.div(:class => ['_784q7', '_3g81g']));
		
		sleep(1)
		
		scroll($browser.div(:class => ['_784q7', '_3g81g']))
		
		sleep(1)

		$following = getFollowing()	
	end

	# Start unfollowing 5 users
	clickButtons($following, 5)

	# Wait a minute
	wait(60*5)

	# Refresh the page
	$browser.refresh
end