require_relative './actions/login.rb'
require_relative './actions/like_tag.rb'
require_relative './actions/follow.rb'
require_relative './actions/unfollow.rb'

login('motoimbecilli', 'asdrubale43')

sleep(2)
like_tag('landscape')
wait(60)