json.extract! choice, :id, :question_id, :body, :correct, :created_at, :updated_at
json.url choice_url(choice, format: :json)
