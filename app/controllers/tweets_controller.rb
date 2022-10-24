class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(updated_at: :desc)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    monster_id = params[:id]
    if (monster_id != nil)
      @monster = Monster.find_by(id:monster_id)
      puts(@monster.name)
    end
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = "Successfully created tweet."
      redirect_to @tweet
    else
      render :tweets
    end
  end

    # if @tweet.save
    #   flash[:notice] = "Successfully created tweet."
    #   redirect_to @tweet
    # end
  def tweet_params
    params.require(:tweet).permit(:content, :monster_id)
  end
end
