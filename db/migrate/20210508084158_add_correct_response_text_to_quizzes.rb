class AddCorrectResponseTextToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :correct_response_text, :string
  end
end
