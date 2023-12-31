class User < ApplicationRecord
  include ImageUploader[:image]
  include Discard::Model

  # 半角英数字, _, +, -, ., @を含む
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  # パスワード用正規表現
  PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*_\-]).{6,}\z/.freeze
  # ふりがなは全角ひらがな
  KANA_REGEX = /\A[ぁ-んー－]+\z/.freeze
  # 郵便番号は7桁の数値
  POSTAL_CODE_REGEX = /\A\d{7}\z/.freeze
  # 電話番号は10桁または11桁の数値
  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze

  with_options presence: true do                
    validates :email,            format: { with: EMAIL_REGEX, message: "は@マークを含む半角英数字で入力してください" }
    validates :name     
    validates :name_reading,     format: { with: KANA_REGEX, message: "はひらがなで入力してください" }
    validates :postal_code,      format: { with: POSTAL_CODE_REGEX, message: "はハイフンなしの7桁の数値で入力してください" }
    validates :prefecture
    validates :city             
    validates :address
    validates :phone_number,     format: { with: PHONE_NUMBER_REGEX, message: "はハイフンなしの10桁または11桁の数値で入力してください" }
    validates :birth_day
  end
end
