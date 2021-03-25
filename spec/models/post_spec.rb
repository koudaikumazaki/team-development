require 'rails_helper' # rails_helperを使うために必要です。何も考えず書いてください
describe Post do # Postモデルについて
  describe '#create' do # createアクションについて
    it "contentがない場合は登録できないこと" do # テストの確認内容を記述
      post = Post.new(content: "") # Postモデルのインスタンス（データ）を作成
      post.valid? # インスタンスを保存する際に、バリデーションにより保存ができない状態であるかを確かめる
      expect(post.errors[:content]).to include("can't be blank") # エラー文に"can't be blank"が含まれるかどうかを判定
    end
  end
end