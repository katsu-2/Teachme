class RecruitmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]

  def index
    @recruitments = Recruitment.includes(:user).includes(:recruitment_categories)
    # binding.pry
  end

  def show
    @user = User.find_by(id: @recruitment.user_id)
  end

  def new
    @recruitment = current_user.recruitments.new
    @recruitment.recruitment_categories.new
  end

  def create
    @recruitment = current_user.recruitments.new(recruitment_params)
    @recruitment.save
    redirect_to recruitments_path
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      flash[:notice] = '投稿に成功しました'
      redirect_to root_path
    else
      render 'edit'
      flash.now[:alert] = '投稿に失敗しました'
    end
  end

  def destroy
    @recruitment.destroy
    flash.now[:alert] = '投稿を削除しました'
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
