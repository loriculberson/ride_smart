module OmniAuthUser
  OmniAuth.config.test_mode = true

  def mock_omniauth_user
    auth = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => '123545',
      :info => {  :name => 'google_mock_user',
                  :email => 'google@example.com'
                },
      :credentials => { :token =>"222333444" }
    })
    OmniAuth.config.mock_auth[:google_oauth2] = auth
  end
end