class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def index
    if params[:user_id]
      @games = User.find(params[:user_id]).games
    elsif params[:title]
      @games = Game.search_by_title(params[:title])
    else
      @games = Game.all
    end
  end 

  def new
    @game = Game.new
    @game.build_review
  end

  def create
    @genres = Genre.all
    @game = current_user.games.build(game_params) 
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to user_path(current_user)
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
  

  def game_params
    params.require(:game).permit(:title, :developer, :year, :genre_ids, review_attributes: [:summary, :opinion, :rating])
  end
  
end