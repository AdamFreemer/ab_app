json.extract! clip, :id, :name, :description, :file_name, :format, :author, :created_at, :updated_at
json.url clip_url(clip, format: :json)