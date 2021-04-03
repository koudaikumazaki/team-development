require 'rails_helper'

describe User do
  describe '#create' do
    it "passwordが8文字以上で、半角英字と半角数字が含まれていれば登録できること" do
      user = build(:user, encrypted_password: "1234567a")
      expect(user).to be_valid
    end

    it "passwordが8文字以上でも、半角英字が含まれていなと登録できないこと" do
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


    it "メールアドレスに全角文字が含まれているとテストがパスしないこと" do
      user = build(:user, email: "さample@gmail.com", encrypted_password: "1234567a" )      
      expect(user).to be_valid
    end

    it "メールアドレスに全角文字が含まれていなければテストがパスすること" do
      user = build(:user, email: "Sample@gmail.com", encrypted_password: "1234567a" )      
      expect(user).to be_valid
    end
  end
end


