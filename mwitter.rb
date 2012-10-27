require          'bundler/setup'
require          'sinatra'
require          'json'
require_relative 'config/database'
require_relative 'lib/mwitter'

# for handle show ten most recent mweets

get("/:handle") {
  user = Mwitter::User.find_by_handle!(params[:handle])
  p request.accept
  mweets = user.mweets.limit(10).order("created_at DESC")
  if request.accept.include? "application/json"
    content_type :json
    mweets.to_json(except:  [:id, :updated_at, :user_id], 
                   include: :user)
  else
  erb :mweets, locals: {   user:   user,
                         mweets: mweets }
  end
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