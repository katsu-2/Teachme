require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe "GET #show" do
    context "登録済みユーザー" do
      before do
        sign_in user
        get :show, params: { id: user.id }
      end

      it "正常にレスポンス返す" do
        expect(response).to be_successful
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end

      it "showテンプレート表示" do
        expect(response).to render_template :show
      end

      it "ユーザーを表示させる" do
        expect(assigns(:user)).to match(user)
      end
    end

    context "未登録ユーザー" do
      before do
        get :show, params: { id: user.id }
      end

      it "正常にレスポンス返す" do
        expect(response).to be_successful
      end

      it "200レスポンス返す" do
        expect(response).to have_http_status 200
      end

      it "showテンプレート表示" do
        expect(response).to render_template :show
      end

      it "ユーザーを表示させる" do
        expect(assigns(:user)).to match(user)
      end
    end
  end

#まだユーザー一覧を作っていないため保留
  # describe "GET #index" do
  #   context "登録済みユーザー" do
  #     before do
  #       sign_in user
  #       get :index
  #     end

  #     it "レスポンスが成功する" do
  #       expect(response).to be_successful
  #     end

  #     it "200レスポンスを返す" do
  #       expect(response).to have_http_status 200
  #     end

  #     it "indexテンプレートを表示させる" do
  #       expect(response).to render_template :index
  #     end

  #     it "ユーザーを表示させる" do
  #       expect(assigns(:users)).to include(user)
  #     end

  #     it "ログインしていないユーザーも表示させる" do
  #       expect(assigns(:users)).to include(other_user)
  #     end
  #   end
  # end
end
