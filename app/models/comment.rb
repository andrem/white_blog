class Comment < ActiveRecord::Base
  belongs_to :posts

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :comment
  
  validates_format_of :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i

end
