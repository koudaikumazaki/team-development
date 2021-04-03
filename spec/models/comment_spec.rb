require 'rails_helper'

describe  Comment do
  describe '#create' do

  it "全ての項目の入力が存在すれば登録できること" do        
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it "投稿がない場合は登録できないこと" do    
    comment = build(:comment, comment: "")
    expect(comment).to be_valid        
  end

  it "投稿内容が140文字の時は登録できること" do    
    comment = build(:comment, comment: "a" * 140 )
    expect(comment).to be_valid        
  end
  
  it "投稿内容が141文字の時はエラーがでること" do    
    comment = build(:comment, comment: "a" * 141 )
    expect(comment).to be_valid        
  end
  
end
end