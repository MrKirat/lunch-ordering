class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: {with: Devise::email_regexp}
  validate :must_have_valid_roles

  rolify

  has_many :admins_roles
  has_many :roles, through: :admins_roles

  include Roleble::Model

  def self.roles
    AdminsRole::ROLES
  end

  include DeviseTokenAuth::Concerns::User

  private

  def must_have_valid_roles
    return if self.roles.blank?
    if self.roles.any? { |role| !Admin.roles.include? role.name.to_sym }
      errors.add(:base, "#{self.roles.map(&:name)} are invalid roles.")
    end
  end
end
