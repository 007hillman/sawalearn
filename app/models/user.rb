class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
   has_many :user_lecture_quiz, dependent: :destroy
   belongs_to :role
   def user_initial
   	name.split("").first + name.split("")[1]
   end 
   def full_name
	"#{name} #{surname}"
   end    
end
