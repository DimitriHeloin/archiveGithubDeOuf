json.array!(@orgs) do |org|
  json.extract! org, :id, :id, :login, :gravatar_id, :url, :avatar_url
  json.url org_url(org, format: :json)
end
