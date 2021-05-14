class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
   has_many :user_lecture_quiz, dependent: :destroy
   belongs_to :role
	before_save :assign_role
   def user_initial
   	name.split("").first + name.split("")[1]
   end 
   def full_name
	"#{name} #{surname}"
   end
	def assign_role
		 self.role = Role.find_by(name: "regular") if role.nil? 
	end
#checking for a specific user's role
	def is?( requested_role )
  	self.role.name  == requested_role.to_s
  end

	
end
