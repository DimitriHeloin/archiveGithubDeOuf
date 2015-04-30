json.array!(@events) do |event|
  json.extract! event, :id, :id, :type, :public
  json.url event_url(event, format: :json)
end
