module SessionsHelper
    #logged_in?とcurrent_userの実装
    
    def current_user  #現在ログインしているユーザを取得するメソッド
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
end
