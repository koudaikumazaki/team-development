require 'rails_helper'

describe User do
  describe '#create' do
    it "全ての項目の入力が存在すれば登録できること" do # テストしたいことの内容
      user = build(:user)  # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入
      expect(user).to be_valid # 変数userの情報で登録がされるかどうかのテストを実行
    end
  end
end