class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
   
   def user_initial
   	name.split("").first + name.split("")[1]
   end 
   def full_name
	"#{name} #{surname}"
   end    
end
