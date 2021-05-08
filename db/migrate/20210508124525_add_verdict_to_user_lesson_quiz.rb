class AddVerdictToUserLessonQuiz < ActiveRecord::Migration[6.1]
  def change
    add_column :user_lesson_quizzes, :verdict, :string, default: "failed"
  end
end
