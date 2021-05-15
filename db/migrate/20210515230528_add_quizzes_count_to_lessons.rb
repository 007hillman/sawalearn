class AddQuizzesCountToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :quizzes_count, :integer
  end
end
