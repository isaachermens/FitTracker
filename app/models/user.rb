class User < ActiveRecord::Base

  has_many :activities

  validates_presence_of :name
  validates :email, presence: true, email:true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid.to_s).first_or_initialize.tap do |user|
      user.update_with_remote_data(user, auth)
    end
  end

  def update_with_remote_data(user, auth)
    user.provider = auth.provider
    user.uid      = auth.uid.to_s
    user.name     = auth.info.name
    user.auth_token = auth.credentials.token
    user.oauth_expires_at = auth.credentials.expires_at ?
        Time.at(auth.credentials.expires_at) :
        Time.new() + (60*60*24) # 1 day from present
    user.picture = auth.info.image || auth.extra.raw_info.avatar_url
    # todo test this against Facebook and Github...will need to do in production or modify our accounts
    user.email = auth.info.email # todo email things need checking
    user.save!
  end

end
