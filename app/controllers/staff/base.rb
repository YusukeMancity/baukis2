class Staff::Base < ApplicationController
  private def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||= # ||= ←は変数の値がnilだった場合に値を代入する
        StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  #ヘルパーメソッドとすることでslimテンプレートでcurrent_staff_memberメソッドを利用できる
  helper_method :current_staff_member
end