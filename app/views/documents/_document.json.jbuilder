json.extract! document, :id, :subject, :body, :state, :created_at, :updated_at
json.url document_url(document, format: :json)
