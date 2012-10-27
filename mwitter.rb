require          'bundler/setup'
require          'sinatra'
require_relative 'config/database'
require_relative 'lib/mwitter'

# for handle show ten most recent mweets

get("/:handle") {
  user = Mwitter::User.find_by_handle!(params[:handle])
  mweets = user.mweets.limit(10).order("created_at DESC")
  erb :mweets, locals: {   user:   user,
                         mweets: mweets }
}

get('/') {
  raise ActiveRecord::RecordNotFound
}

post('/:handle/mweeter') {
  user = Mwitter::User.find_by_handle!(params[:handle])
  user.mweets.create!(body: params[:mweet])
  redirect "/#{user.handle}"
}

error(ActiveRecord::RecordNotFound) {
  "User not found"
}