class StaffMember < ApplicationRecord
  has_many :events, class_name: "StaffEvent", dependent: :destroy
  
  def password=(raw_password)
    if raw_password.kind_of?(String) #kind.of?メソッドで渡された値がString型かどうか判断している
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end
end
