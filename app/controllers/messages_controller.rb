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

    # commit
    @message.save

    # TODO まだ、わかっていない
    redirect_to root_path , notice: 'メッセージを保存しました'
  end

  private

  # Rails4からStrongParamaterと呼ばれる機能が追加
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できない
  def message_params
    params.require(:message).permit(:name, :body)
  end

end
