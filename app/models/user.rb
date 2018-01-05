class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile


  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true

  def has_profile?
    profile.present? && profile.persisted?
  end

  def full_name
    profile.full_name
  end
end
