class MessagesController < ApplicationController
  def index
    # 初期化
    @message = Message.new
    # 一覧の取得
    @messages = Message.all
  end

  def create
    # リクエストパラメータを取得して、DBに登録
    @message = Message.new(message_params)

      # コミット
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end

  private

  # Rails4からStrongParamaterと呼ばれる機能が追加
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できない
  def message_params
    params.require(:message).permit(:name, :body)
  end

end
