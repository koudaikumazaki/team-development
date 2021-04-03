require 'rails_helper'

describe Post do
  describe '#create' do

  it "全ての項目の入力が存在すれば登録できること" do        
    post = build(:post)
    expect(post).to be_valid
  end

  it "投稿がない場合は登録できないこと" do    
    post = build(:post, content: "")
    expect(post).to be_valid        
  end

  it "投稿内容が140文字の時は登録できること" do    
    post = build(:post, content: "a" * 140 )
    expect(post).to be_valid        
  end

  it "投稿内容が141文字の時はエラーがでること" do    
    post = build(:post, content: "a" * 141 )
    expect(post).to be_valid        
  end
  
end
end