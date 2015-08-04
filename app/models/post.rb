class Post < ActiveRecord::Base
  belongs_to :username
  belongs_to :keyword
end
