json.extract! task, :id, :title, :content, :start_date, :end_date, :created_at, :updated_at
json.url task_url(task, format: :json)
