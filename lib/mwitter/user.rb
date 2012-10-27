module Mwitter
  class User < ActiveRecord::Base
    
    validates_presence_of   :handle
    validates_format_of     :handle, with: /\A[-A-Za-z0-9_]+\z/
    validates_uniqueness_of :handle
    
    has_many :mweets
    
    attr_accessible :handle
    
    def as_json(options={})
      { created_at: created_at,
        handle:     handle }
    end
  end
end