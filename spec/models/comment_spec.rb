require 'rails_helper'

describe  Comment do
  describe '#create' do

      it "全ての項目の入力が存在すれば、コメントが作成できること" do        
        comment = build(:comment)
        expect(comment).to be_valid
      end

      it "投稿がない場合は、コメントが作成できないこと" do    
        comment = build(:comment, comment: "")
        expect(comment).to_not be_valid         
      end

      it "投稿内容が140文字以内の時は、コメントが作成できること" do    
        comment = build(:comment, comment: "a" * 140 )
        expect(comment).to be_valid        
      end
      
      it "投稿内容が141文字以上の時は、コメントが作成できないこと" do    
        comment = build(:comment, comment: "a" * 141 )
        expect(comment).to_not be_valid         
      end  
  end
end