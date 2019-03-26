class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]

  def index
    @recruitments = Recruitment.all
  end

  def show
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.save
    redirect_to root_path
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
      params.require(:recruitment).permit(:title, :content, :hope_day)
    end

    def set_recruitment
      @recruitment = Recruitment.find(params[:id])
    end
end
