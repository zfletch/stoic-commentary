class PasswordReset
  include ActiveModel::Model

  attr_accessor :email, :token

  validates :email, presence: true

  validate :user_exists

  def user
    @user ||= User.find_by(email: email)
  end

  def set_token!
    self.token = verifier.encode(user.id, expires_in: 1.hour, purpose: :password_reset)
  end

  def user_from_token!
    verifier.decode(token, purpose: :password_reset)&.tap do |id|
      @user = User.find(id)
      @email = user.email
    end
  end

  private

  def verifier
    @verifier ||= Verifier.new(Rails.application.secrets.password_reset_key)
  end

  def user_exists
    return if user

    errors.add(:email, :no_user)
  end
end
