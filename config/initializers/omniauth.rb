Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['878814590413-jejqtrdbev7l4edu67vbka2m1is1rqig.apps.googleusercontent.com '], ENV['T-Q0GVh4riP0W6VXb2InaIOb'], scope: 'userinfo.profile,youtube'
  OmniAuth.config.on_failure do |env|
	  error_type = env['omniauth.error.type']
	  new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
	  [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
	end
end