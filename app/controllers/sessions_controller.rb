class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインに成功しました。"
      redirect_to controller: :mutalks, action: :index
      
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
  
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email) #同じメールアドレスを持つユーザを検索し@userへ代入
    if @user && @user.authenticate(password)  #email,passwordの組み合わせを見て
      #ログイン成功
      session[:user_id] = @user.id
      return true
    else
      #ログイン失敗
      return false  #合っていなければfalseを返してログイン出来ない
    end
  end
  
end
