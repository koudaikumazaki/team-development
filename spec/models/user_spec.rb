require 'rails_helper'

describe User do
  describe '#create' do

        it "passwordが7文字以下であれば、Userが作成できないこと" do
          user = build(:user, password: "1234567")
          expect(user).to_not be_valid
        end

        it "passwordが8文字以上で、半角英字と半角数字が含まれていれば、Userが作成できること" do
          user = build(:user, password: "1234567a")
          expect(user).to be_valid
        end

        it "passwordが8文字以上でも、半角英字が含まれていなと、Userが作成できないこと" do
          user = build(:user, password: "12345678")
          expect(user).to_not be_valid
        end

        it "passwordが8文字以上でも、半角数字がが含まれていないと、Userが作成できないこと" do
          user = build(:user, password: "a"*8)
          expect(user).to_not be_valid
        end

        it "passwordが32文字以上であれば、Userが作成できないこと" do
          user = build(:user, password: "12345671234567123456712345671234")
          expect(user).to_not be_valid
        end

        it "passwordが33文字以上であれば、Userが作成できないこと" do
          user = build(:user, password: "123456712345671234567123456712345")
          expect(user).to_not be_valid
        end


        it "メールアドレスに全角文字が含まれていると、Userが作成できないこと" do
          user = build(:user, email: "さample@gmail.com", password: "1234567a" )      
          # expect(user).to be_valid          
          expect(user).to_not be_valid
        end

        it "メールアドレスに全角文字が含まれていなければ、Userが作成できること" do
          user = build(:user, email: "Sample@gmail.com", password: "1234567a" )      
          expect(user).to be_valid
        end
                
        it "重複したemailが存在する場合登録できないこと" do
          user = create(:user) 
          another_user = build(:user, email: user.email) 
          another_user.valid? 
          expect(another_user.errors[:email]).to include("はすでに存在します")
        end
  end
end