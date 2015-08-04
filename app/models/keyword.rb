class Keyword < ActiveRecord::Base
  belongs_to :username
  belongs_to :post
end
