class User < ApplicationRecord
  validates_presence_of :password, :email

end
