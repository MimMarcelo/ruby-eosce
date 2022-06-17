json.extract! exam_apply, :id, :exam_id, :student_name, :student_email, :student_id, :created_at, :updated_at
json.url exam_apply_url(exam_apply, format: :json)
