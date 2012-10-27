module Mwitter
  class Mweet < ActiveRecord::Base
    
    validates_presence_of :body, :user
    validates_length_of   :body, maximum: 142
    
    belongs_to :user
    
    attr_accessible :body
  end
end