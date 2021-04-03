require 'rails_helper'

describe User do
  describe '#create' do    
  
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