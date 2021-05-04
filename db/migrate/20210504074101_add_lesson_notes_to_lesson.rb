class AddLessonNotesToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :lesson_notes, :text
  end
end
