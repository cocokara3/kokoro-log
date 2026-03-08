class SessionsController < ApplicationController
  def new
    
  end

  def create
    # 1. 入力されたメールアドレスでユーザーを探す
    user = User.find_by(email: params[:session][:email].downcase)
    
    # 2. ユーザーが存在し、かつパスワードが正しいかチェック
    if user && user.authenticate(params[:session][:password])
      # 3. 合鍵（セッション）を渡してログイン状態にする
      session[:user_id] = user.id
      redirect_to user, notice: "ログインしました！"
    else
      # 4. 失敗したらエラーメッセージを出してログイン画面に戻す
      flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # ログアウト
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました", status: :see_other
  end
end
