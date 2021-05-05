json.extract! quiz, :id, :question, :option1, :option2, :option3, :option4, :correct_response, :lesson_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
