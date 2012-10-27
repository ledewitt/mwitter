require          'bundler/setup'
require_relative 'config/database'

# for handle show ten most recent mweets

get("/:handle") {
  user = MWitter::User.find_by_handle(params[:handle])
  
  user.mweets.first.body
}