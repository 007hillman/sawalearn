class Quiz < ApplicationRecord
  belongs_to :lesson, :counter_cache => true
  has_many :user_lesson_quiz, dependent: :destroy 
end
