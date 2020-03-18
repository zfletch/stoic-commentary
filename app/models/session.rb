class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true

  validate :can_authenticate

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def can_authenticate
    return if user && user.authenticate(password)

    errors.add(:email, :cannot_authenticate)
  end
end
