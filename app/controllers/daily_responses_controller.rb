class DailyResponsesController < ApplicationController
  # ログインしていないと使えないようにする
  before_action :authenticate_user!

  def new
    @daily_response = current_user.daily_responses.new(logged_on: Date.today)
  end

  def create
    @daily_response = current_user.daily_responses.new(daily_response_params)
    if @daily_response.save
      redirect_to daily_responses_path, notice: "記録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @daily_responses = current_user.daily_responses.order(logged_on: :desc)
  end

  private

  def daily_response_params
    params.require(:daily_response).permit(:mood_score, :answer_text, :logged_on)
  end

  # 未ログインならログイン画面へ飛ばす
  def authenticate_user!
    redirect_to login_path, alert: "ログインしてください" unless current_user
  end
end
