Rails.application.config.middleware.use OmniAuth::Builder do
  provider :line,
           ENV['LINE_CHANNEL_ID'],
           ENV['LINE_CHANNEL_SECRET'],
           {
             provider_ignores_state: false,  # CSRF対策のstateを有効にする
             scope: 'profile openid email',
             bot_prompt: 'normal'
           }
end