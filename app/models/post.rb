class Post < ActiveRecord::Base
	  extend FriendlyId
  	friendly_id :title, use: :slugged

  	acts_as_votable
end
