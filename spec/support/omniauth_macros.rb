module OmniauthMacros
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '12345',
        info: {
          name: 'facebook_user',
          email: 'facebook@test.com'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end

  def google_mock
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      {
        provider: 'google',
        uid: '12345444',
        info: {
          name: 'google_user',
          email: 'google@test.com'
        },
        credentials: {
          token: 'hogefugahoge'
        }
      }
    )
  end
end
