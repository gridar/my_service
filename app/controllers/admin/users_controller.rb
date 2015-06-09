class Admin::UsersController < AdminController
  def index
    params.delete(:q) if params[:q].blank?
    @q = User.search(params[:q])
    @users = @q.result.page(params[:page]).per(50)
  end
end