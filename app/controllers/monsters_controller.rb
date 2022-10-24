class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
    cant_tweets = Tweet.where(monster_id: @monster.id).count
    if cant_tweets == 0
      redirect_to "/tweets/new/#{@monster.id}"
    end
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)

    if @monster.save
      redirect_to @monster, notice: "Todo legal"
    else
      render :new, status: :see_other
    end
  end

  def monster_params
    params.require(:monster).permit(:name, :description)
  end
end
