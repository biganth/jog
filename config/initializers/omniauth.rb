Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :twitter, '3Ck4ly0SPLn6moGc72Wv0w', 'A9o0TefXT7bi0cnEeV4ZkIJKuhiZRuwBCSujwAQ10bo'
end