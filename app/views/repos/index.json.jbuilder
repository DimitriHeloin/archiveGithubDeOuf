json.array!(@repos) do |repo|
  json.extract! repo, :id, :id, :name, :url
  json.url repo_url(repo, format: :json)
end
