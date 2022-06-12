class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index  #降順にユーザの一覧を取得
    @pagy, @users = pagy(User.order(id: :desc), items: 25)  #1ページ25件表示のページネーション
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to @user  #処理をuser#showアクションへと強制的に移動
      
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new   #単にusers/new.html.erbを表示するのみ
    end
  end
  
  # def likings
  #   @user = User.find(params[:id])
  #   @pagy, @likings = pagy(@user.likings)
  #   counts(@user)
  # end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
