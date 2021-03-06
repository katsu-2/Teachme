class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]

  def index
    @recruitments = Recruitment.page(params[:page]).per(9).recent.includes(:user)
  end

  def show
    @user = User.find_by(id: @recruitment.user_id)
  end

  def new
    @recruitment = current_user.recruitments.new
  end

  def create
    @recruitment = current_user.recruitments.new(recruitment_params)
    if @recruitment.save
      flash[:notice] = '投稿に成功しました'
      redirect_to recruitments_path
    else
      render 'new'
      flash[:notice] = '必須項目を入力してください'
    end
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      flash[:notice] = '編集に成功しました'
      redirect_to root_path
    else
      render 'edit'
      flash[:notice] = '編集に失敗しました'
    end
  end

  def destroy
    @recruitment.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to recruitments_path
  end




  private
    def recruitment_params
      params.require(:recruitment).permit(:title, :content, :hope_day, category_ids: [])
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
    end


end
