json.extract! story_question, :id, :story_id, :question, :response, :created_at, :updated_at
json.url story_question_url(story_question, format: :json)
