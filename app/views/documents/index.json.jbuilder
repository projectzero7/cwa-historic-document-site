json.array!(@documents) do |document|
  json.extract! document, :id, :project_id
  json.url document_url(document, format: :json)
end
