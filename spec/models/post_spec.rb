require 'rails_helper'

describe Post do
  describe '#create' do

    it "全ての項目の入力が存在すれば、投稿が作成できること" do        
      post = build(:post)
      expect(post).to be_valid
    end

    it "投稿がない場合は、投稿が作成できないこと" do    
      post = build(:post, content: "")
      expect(post).to_not be_valid         
    end

    it "投稿内容が140文字以内の時は、投稿が作成できること" do    
      post = build(:post, content: "a" * 140 )
      expect(post).to be_valid        
    end

    it "投稿内容が141文字以上の時は、投稿が作成できないこと" do    
      post = build(:post, content: "a" * 141 )
      expect(post).to_not be_valid        
    end 
  end
end