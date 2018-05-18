require 'pry'
require 'watir'

$username = 'motoimbecilli'
$password = 'asdrubale43'
$following = []


$browser = Watir::Browser.new :chrome, switches: ['--incognito']
puts '> Loading browser'