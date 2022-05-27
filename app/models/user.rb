class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
  
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, 
  :omniauthable, omniauth_providers: [:github, :google_oauth2]
  
  has_many :invitations, class_name: self.to_s, as: :invited_by
  has_many :groups
  has_many :friends

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
