require "typhoeus"
require "json"

URL = "http://192.168.1.112:9393"

# sending some data
# p Typhoeus::Request.post("#{URL}/JEG2/mweeter", params: {mweet: "Test post."})

# reading some data
mweets = Typhoeus::Request.get( "#{URL}/JEG2",
                                headers: {"Accept" => "application/json"} )
p JSON.parse(mweets.body).first["mweet"]["user"]["handle"]
