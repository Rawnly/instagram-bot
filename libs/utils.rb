require 'pry'
require 'watir'

require_relative './config.rb'

def focus(element)
	if element.exists?
		puts "> Clicking"
		element.click
	else
		puts "> Nothing to click"	
	end
end

def getFollowing()
	puts "> GETTING FOLLOWING"
	return $browser.buttons(:class => ["_qv64e","_t78yp","_4tgw8","_njrw0"]);
end

def clickButtons(list, max = 5)
	(0...max).each do |index|
		list[index].click
		sleep(5)
	end
end

def scroll(element = $browser.div(:class => ['_784q7', '_3g81g'])) 
	if element.exists? 
		element.click
	end
	
	$browser.send_keys :space

	puts "> SCROLLING"
end

def wait(n = 10)
	if n > 1
		(0...n).each do |sec|
			puts n - sec
			sleep(1)
		end
	else
		sleep(n)
	end
end

def useLink(classes) 
	link = $browser.link(:class => classes)
	
	if link.exists?
		puts "> Moving to #{link.href}"
		link.click
	else
		puts "> NO link found"
	end
end

def fill(name, value)
	puts "> Filling \"#{name}\""
 	$browser.text_field(:name => name).set value
end

def delay()
	timeout =  (rand(0.5...4.5)*100).round / 100.0
	wait(timeout)
end
