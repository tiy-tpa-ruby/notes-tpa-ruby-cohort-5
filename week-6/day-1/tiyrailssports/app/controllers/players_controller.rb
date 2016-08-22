class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  # Ooops, this is really *authentication*
  before_action :authenticate!

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    # The before_action `set_player` gives us @player
    #
    # This is *authorization*
    if @player.user != current_user
      redirect_to players_path
      return
    end
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    # Also set the user_id for this player to the current user's id
    @player.user_id = current_user.id

    # Or just assign them as objects to objects. Rails will fill in
    # user_id with the id from the `current_user`
    #
    # This is the more *rails way*
    @player.user = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    unless @player.authorized?(current_user)
      redirect_to @player, notice: "Nope, you are not authorized"
      return
    end

    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    unless @player.authorized?(current_user)
      redirect_to players_path, notice: "Nope, not authorized"
      return
    end

    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :age, :shirt_size, :birthday)
    end
end
