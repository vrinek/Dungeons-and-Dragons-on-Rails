class NonPlayerCharactersController < ApplicationController
  # GET /non_player_characters
  # GET /non_player_characters.json
  def index
    @non_player_characters = NonPlayerCharacter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @non_player_characters }
    end
  end

  # GET /non_player_characters/1
  # GET /non_player_characters/1.json
  def show
    @non_player_character = NonPlayerCharacter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @non_player_character }
    end
  end

  # GET /non_player_characters/new
  # GET /non_player_characters/new.json
  def new
    @non_player_character = NonPlayerCharacter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @non_player_character }
    end
  end

  # GET /non_player_characters/1/edit
  def edit
    @non_player_character = NonPlayerCharacter.find(params[:id])
  end

  # POST /non_player_characters
  # POST /non_player_characters.json
  def create
    @non_player_character = NonPlayerCharacter.new(params[:non_player_character])

    respond_to do |format|
      if @non_player_character.save
        format.html { redirect_to @non_player_character, notice: 'Non player character was successfully created.' }
        format.json { render json: @non_player_character, status: :created, location: @non_player_character }
      else
        format.html { render action: "new" }
        format.json { render json: @non_player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /non_player_characters/1
  # PUT /non_player_characters/1.json
  def update
    @non_player_character = NonPlayerCharacter.find(params[:id])

    respond_to do |format|
      if @non_player_character.update_attributes(params[:non_player_character])
        format.html { redirect_to @non_player_character, notice: 'Non player character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @non_player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_player_characters/1
  # DELETE /non_player_characters/1.json
  def destroy
    @non_player_character = NonPlayerCharacter.find(params[:id])
    @non_player_character.destroy

    respond_to do |format|
      format.html { redirect_to non_player_characters_url }
      format.json { head :no_content }
    end
  end
end
