class CreateUserLessonQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_lesson_quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
