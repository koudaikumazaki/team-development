require 'rails_helper' 
describe Post do 
  describe '#create' do 
    it "contentがない場合は登録できないこと" do 
      post = Post.new(content: "")
      post.valid? 
      expect(post.errors[:content]).to include("can't be blank") 
    end
  end
end