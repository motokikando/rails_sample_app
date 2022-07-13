module SessionsHelper
    #渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    #ユーザーのセッションを永続的にする
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    #記憶トークンのcookieに対応するユーザーを返す
    def current_user
        #（ユーザーIDにユーザーIDのセッションを代入した結果）ユーザーIDのセッションが存在すれば
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticate?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end 
    end

    #ユーザーがログインしていればtrue, その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
