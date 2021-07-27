json.extract! question, :id, :body, :kind, :created_at, :updated_at
json.url question_url(question, format: :json)
