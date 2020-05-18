class Admin::Authenticator
  def initialize(administrator)
    @administrator = administrator #administratorはsessions_controllerで定義されている
  end

  def authenticate(raw_password)
    @administrator &&
      @administrator.hashed_password &&
      BCrypt::Password.new(@administrator.hashed_password) == raw_password
  end
end