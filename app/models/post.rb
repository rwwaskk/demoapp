class Post < ActiveRecord::Base
 
  belongs_to :user
  validates :content, length:{maximum:200}
  validates :user_id , presence:true
end
