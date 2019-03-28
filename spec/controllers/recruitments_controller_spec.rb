require 'rails_helper'

RSpec.describe RecruitmentsController, type: :controller do
  describe "GET #index" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:recruitment) { create(:recruitment, user: user) }
    let!(:other_recruitment) { create(:recruitment, user: other_user) }

    context "登録済みユーザー" do
      before do
        sign_in user
        get :index
      end

      it "正常なレスポンスを返す" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレを表示" do
        expect(response).to render_template :index
      end

      it "userの投稿を表示" do
        expect(assigns(:recruitments)).to include(recruitment)
      end

      it "other_userの投稿を表示" do
        expect(assigns(:recruitments)).to include(other_recruitment)
      end

      it "投稿数が2になる" do
        expect(assigns(:recruitments).count).to eq 2
      end
    end

    context "未登録ユーザー" do
      before do
        get :index
      end

      it "正常なレスポンスを返す" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "indexテンプレを表示" do
        expect(response).to render_template :index
      end

      it "userの投稿を表示" do
        expect(assigns(:recruitments)).to include(recruitment)
      end

      it "other_userの投稿を表示" do
        expect(assigns(:recruitments)).to include(other_recruitment)
      end

      it "投稿数が2になる" do
        expect(assigns(:recruitments).count).to eq 2
      end
    end
  end

  describe "GET #show" do
    let!(:user) { create(:user) }
    let!(:recruitment) { create(:recruitment, user: user) }

    context "登録済みユーザー" do
      before do
        sign_in user
        get :show, params: { id: recruitment.id }
      end

      it "正常なレスポンス表示" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "showテンプレを表示" do
        expect(response).to render_template :show
      end

      it "投稿を表示" do
        expect(assigns(:recruitment)).to match(recruitment)
      end

    end

    context "未登録ユーザー" do
      before do
        get :show, params: { id: recruitment.id }
      end

      it "正常なレスポンス表示" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "showテンプレを表示" do
        expect(response).to render_template :show
      end

      it "投稿を表示" do
        expect(assigns(:recruitment)).to match(recruitment)
      end

    end
  end

  describe "GET #new" do
    let!(:user) { create(:user) }
    let!(:recruitment) { create(:recruitment, user: user) }
    context "登録済みユーザー" do
      before do
        sign_in user
        get :new, params: {}
      end

      it "正常なレスポンス表示" do
        expect(response).to be_successful
      end

      it "200レスポンスを返す" do
        expect(response).to have_http_status 200
      end

      it "newテンプレを表示" do
        expect(response).to render_template :new
      end

      it "@recruitmentが定義される" do
        expect(assigns(:recruitment)).to be_a_new Recruitment
      end
    end

    context "未登録ユーザー" do
      before do
        get :new, params: {}
      end

      it "レスポンス失敗" do
        expect(response).to_not be_successful
      end

      it "302レスポンスを返す" do
        expect(response).to have_http_status 302
      end

      it "@recruitmentが定義されない" do
        expect(assigns(:recruitment)).to_not be_a_new Recruitment
      end

      it "ログインページにリダイレクト" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # describe "POST #create" do
  #   let!(:user) { create(:user) }
  #   let(:recruitment_attributes) { attributes_for(:recruitment) }

  #   context "登録済みユーザー" do
  #     before do
  #       sign_in user
  #     end

  #     it "302レスポンスを返す" do
  #       recruitment :create, params: { recruitment: recruitment_attributes }
  #       expect(response).to have_http_status 302
  #     end

  #     it "投稿を保存する" do
  #       expect {
  #         recruitment :create, params: { recruitment: recruitment_attributes }
  #       }.to change(recruitment_attributes, :count).by(1)
  #     end

  #     it '投稿に成功したら、投稿一覧ページにリダイレクトする' do
  #       recruitment :create, params: { recruitment: recruitment_attributes }
  #       expect(response).to redirect_to(recruitments_path)
  #     end
  #   end
  # end
end
