class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: Devise::email_regexp }

  include DeviseTokenAuth::Concerns::User
end
