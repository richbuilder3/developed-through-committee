class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_presence_of :type, :name

   	# routes addition
   # devise_for :users, :controllers => {:registrations => "users/registrations", :passwords +> "users/passwords"}
end
