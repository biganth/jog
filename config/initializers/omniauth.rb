Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c26e7b1939f1a9755a7e', 'd4b4539fcb1ef27d98dfa69325cdf1c3c7ce5ebf'
  provider :twitter, '3Ck4ly0SPLn6moGc72Wv0w', 'A9o0TefXT7bi0cnEeV4ZkIJKuhiZRuwBCSujwAQ10bo'
end