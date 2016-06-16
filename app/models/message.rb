class Message < ActiveRecord::Base
  # 名前は必須入力かつ20文字以内
  validates :name , length: { maximum: 20 } , presence: true
  # 内容は必須入力かつ2文字以上30文字以下(文字数でチェック)
  validates :body , length: { minimum: 2, maximum: 30 } , presence: true
  # validates :age , numericality: { only_integer: true , greater_than_or_equal_to: 0}, length: { maximum: 3 }
  validates :age , numericality: { only_integer: true , greater_than_or_equal_to: 0}, allow_blank:true, length: { maximum: 3 }
end
