require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/mwitter'

# for handle show ten most recent mweets

get("/:handle") {
  user = Mwitter::User.find_by_handle(params[:handle])

  user.mweets.first.body
}