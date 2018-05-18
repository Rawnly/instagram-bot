require 'pry'
require 'watir'

require_relative '../libs/config.rb'
require_relative '../libs/utils.rb'

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
