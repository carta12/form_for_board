class Admin::ApplicationController < ApplicationController
  before_action:check_admin
  layout 'admin'

  private
  def check_admin
    #지금 접속한 사람이 관리자인지 판별하고
    # 아닐 경우 루트페이지로

    unless user_signed_in? && current_user.admin?
      redirect_to(root_path, alert: "관리자 계정으로 와라")
    end

  end
end
