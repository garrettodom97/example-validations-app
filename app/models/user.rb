class EmailValidator < ActiveModel::Validator
  def validate(user)
    if !user.email.include?("@")
      user.errors.add :email, "must contain an @ symbol"
    end
  end
end

class User < ApplicationRecord
  validates_with EmailValidator
  validates :first_name, :last_name, presence: true
  validate :email_ends_in_dot_com

  def email_ends_in_dot_com
    if email[-4..-1] != ".com"
      errors.add(:email, "must end in .com")
    end
  end
end
