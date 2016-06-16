class MessagesController < ApplicationController

  # edit,updateメソッドの前にset_messageを実行  
  before_action :set_message, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update

    if @message.update(message_params)
      redirect_to root_path , notice: 'メッセージを保存しました'
      
      # 自分の画面にメッセージを正常終了するメッセージを表示
      # flash.now[:notice] = "メッセージを保存しました"
      # render 'edit'

    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'edit'
    end

  end

  def destroy
    # リクエストパラメータを取得して、DBに登録
    @message.destroy

    redirect_to root_path , notice: 'メッセージを削除しました'

  end

  private

  # Rails4からStrongParamaterと呼ばれる機能が追加
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できない
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end
