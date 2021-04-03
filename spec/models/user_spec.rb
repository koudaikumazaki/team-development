require 'rails_helper'

describe User do
  describe '#create' do
    
    # it "全ての項目の入力が存在すれば登録できること" do # テストしたいことの内容
    #   user = build(:user)  # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入
    #   user.encrypted_password = "abcdefjhasdfghjkzaadadadadada"
    #   expect(user).to be_valid # 変数userの情報で登録がされるかどうかのテストを実行
    # end


    # it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
    #   user = build(:user, encrypted_password: "") 
    #   user.valid?
    #   expect(user.errors[:encrypted_password]).to include("は8文字以上で入力してください")
    # end

    it "passwordが8文字以上であれば登録できること" do
      user = build(:user, encrypted_password: "12345678")
      expect(user).to be_valid
    end

    it "passwordが7文字以下であれば登録できないこと" do
      user = build(:user, encrypted_password: "1234567")
      expect(user).to be_valid
    end

    it "passwordが33文字以上であれば登録できないこと" do
      user = build(:user, encrypted_password: "123456712345671234567123456712345")
      expect(user).to be_valid
    end

  end
end


# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "name", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end


# Userモデル
# メールアドレスに全角文字が含まれていないこと

# パスワードは半角英字と半角数字のいずれとも含まれていること