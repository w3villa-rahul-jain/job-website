json.extract! job, :id, :name, :description, :posts, :created_at, :updated_at
json.url job_url(job, format: :json)
