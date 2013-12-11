class User < ActiveRecord::Base
  validates_presence_of :user_name, :email, :uid, :access_token, :access_token_secret
end
