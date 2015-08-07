json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :post_id, :content
  json.url keyword_url(keyword, format: :json)
end
