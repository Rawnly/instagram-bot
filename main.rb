require_relative './actions/login.rb'
require_relative './actions/unfollow.rb'
require_relative './actions/follow.rb'
require_relative './actions/like_tag.rb'

class InstaBot
	def initialize(username, password) 
		@@user = username
		@@pass = password
		@@browser = Watir::Browser.new :chrome, switches: ['--incognito'];
	end

	def unfollowSome
		b = @@browser

		followingCount = b.link(:href => '/motoimbecilli/following/')
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
			focus(b.div(:class => ['_784q7', '_3g81g']));
			
			sleep(1)
			
			scroll(b.div(:class => ['_784q7', '_3g81g']))
			
			sleep(1)
	
			$following = getFollowing()	
		end
	
		# Start unfollowing 5 users
		clickButtons($following, 5)
	
		# Wait a minute
		wait(60*5)
	
		# Refresh the page
		b.refresh
	end

	def followSome
		b = @@browser
		puts "FOLLOWING SOME PEOPLE"
	end

	def login
		b = @@browser

		puts '> Navigating to instagram'
		b.goto 'https://www.instagram.com/accounts/login/'
		
		puts "< ---- >"
		fill('username', @@user)
		fill('password', @@pass)
		puts "< ---- >"
		
		focus(b.button(:class => ['_qv64e','_gexxb', '_4tgw8', '_njrw0']))
		sleep(2)
		
		b.goto "https://www.instagram.com/#{@@user}/"
		sleep(2)
	end

	def like_tag(tag)
		b = $browser
		b.goto "https://www.instagram.com/explore/tags/#{tag}/"
	
		delay
		links = b.links
	
		if links.count >= 1
			photos = links.select do |link|
				/\/p\/[A-z0-9]+\/\?tagged=#{tag}/ =~ link.href
			end
	
			photos.each_with_index do |photo,index|
				if index == 0
					delay
					photo.click
				else
					delay
					_next = b.link(:class => ['_3a693', 'coreSpriteRightPaginationArrow'])
					if _next.exists?
						_next.click
					else
						puts "NO NEXT BUTTON"					
					end
				end
	
				delay
				_like = b.link(:class => ['_eszkz', '_l9yih'])
				if _like.exists?
					_like.click
				else
					puts "NO LIKE BUTTON"
				end
			end
		end
	end
end


