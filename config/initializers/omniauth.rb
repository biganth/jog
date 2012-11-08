Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['c26e7b1939f1a9755a7e'], ENV['d4b4539fcb1ef27d98dfa69325cdf1c3c7ce5ebf']
end