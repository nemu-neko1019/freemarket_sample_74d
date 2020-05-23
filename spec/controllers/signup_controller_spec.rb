require 'rails_helper'
describe SignupController do
  describe 'GET #step1' do
    it "step1.html.hamlに遷移すること" do
      get :step1
      expect(response).to render_template :step1
    end

    it "@userに正しい値が入っていること" do
      user = create(:user)
    end
  end

  describe 'GET #step2' do
    context "成功した場合" do
      subject {
        user_params = attributes_for(:user)
        get :step2, params: {user: user_params},
        session: {
        nickname: "るるるる",
        firstname: "太郎",
        familyname:"山田",
        firstname_kana: "タロウ",
        familyname_kana: "ヤマダ",
        birthyear: "2017",
        birthmonth: 10,
        birthday:30,
        email: "aaa@gmail.com",
        password: "a9a9a9a9",
        password_confirmation: "a9a9a9a9",
        }
      }
      describe "get #step2" do
      before do
        session[:nickname] = user_params[:nickname]
        session[:email] = user_params[:email]
        session[:password] = user_params[:password]
        session[:password_confirmation] = user_params[:password_confirmation]
        session[:firstname] = user_params[:firstname]
        session[:familyname] = user_params[:familyname]
        session[:firstname_kana] = user_params[:firstname_kana]
        session[:familyname_kana] = user_params[:familyname_kana]
        session[:birthyear] = user_params[:birthyear]
        session[:birthmonth] = user_params[:birthmonth]
        session[:birthday] = user_params[:birthday]
      end
      end
    
      it "正常なレスポンス" do
        subject
        expect(response).to be_success
      end
      it "200レスポオンスを返すこと" do
        user_params = attributes_for(:user)
          subject
        expect(response).to have_http_status "200"
      end

    end
    context "無効なデータ" do
      subject {
        user_params = attributes_for(:user, nickname: "")
        get :step2, params: {user: user_params},
        session: {
        nickname: "るるるる",
        firstname: "太郎",
        familyname:"山田",
        firstname_kana: "タロウ",
        familyname_kana: "ヤマダ",
        birthyear: "2017",
        birthmonth: 10,
        birthday:30,
        email: "aaa@gmail.com",
        password: "a9a9a9a9",
        password_confirmation: "a9a9a9a9",
        }
      }
      it "@userに正しい値が入っていること" do
        user = create(:user)
      end  
      it "step1にrenderする" do
        subject
        expect(response).to render_template :step1
      end
    end
  end

  describe 'Post #create' do
    context "成功した場合" do
      subject {
        user_params = attributes_for(:user)
        post :create, params: {user: user_params},
        session: {
          nickname: "るるるる",
          firstname: "太郎",
          familyname:"山田",
          firstname_kana: "タロウ",
          familyname_kana: "ヤマダ",
          birthyear: "2017",
          birthmonth: 10,
          birthday:30,
          email: "aaa@gmail.com",
          password: "a9a9a9a9",
          password_confirmation: "a9a9a9a9",
          sending_destination_attributes: [
            postalcode: "9687465",
            prefecture_code: "32",
            municipal_district: "大阪",
            housenumber: "765",
            buildingname: "gwwe",
            phonenumber: "57685746576",
            ids: "1"
          ]
        }
      }
      it "@userに正しい値が入っていること" do
        user = create(:user)
      end
      it "正常なレスポンス" do
        user_params = attributes_for(:user)
          subject
          expect(response).to be_success
      end
    end
    context "無効なデータ" do
      subject {
        user_params = attributes_for(:user, nickname: "")
        post :create, params: {user: user_params},
        session: {
          nickname: "",
          firstname: "太郎",
          familyname:"山田",
          firstname_kana: "タロウ",
          familyname_kana: "ヤマダ",
          birthyear: "2017",
          birthmonth: 10,
          birthday:30,
          email: "aaa@gmail.com",
          password: "a9a9a9a9",
          password_confirmation: "a9a9a9a9"
          }
      }
      it "200レスポオンスを返すこと" do
        user_params = attributes_for(:user)
          subject
        expect(response).to have_http_status "200"
      end
      it "step2にrenderする" do
        subject
        expect(response).to render_template :step2
      end
    end
  end
end
