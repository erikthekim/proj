json.extract! admin_post, :id, :name, :title, :content, :created_at, :updated_at
json.url admin_post_url(admin_post, format: :json)
