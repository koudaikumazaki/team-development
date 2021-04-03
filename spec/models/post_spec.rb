require 'rails_helper'

describe Post do
  describe '#create' do

  it "全ての項目の入力が存在すれば登録できること" do      
    post = build(:post)
    expect(post).to be_valid
  end



end
end