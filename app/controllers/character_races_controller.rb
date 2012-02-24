class CharacterRacesController < ApplicationController
  # GET /character_races
  # GET /character_races.json
  def index
    @character_races = CharacterRace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_races }
    end
  end

  # GET /character_races/1
  # GET /character_races/1.json
  def show
    @character_race = CharacterRace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_race }
    end
  end

  # GET /character_races/new
  # GET /character_races/new.json
  def new
    @character_race = CharacterRace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_race }
    end
  end

  # GET /character_races/1/edit
  def edit
    @character_race = CharacterRace.find(params[:id])
  end

  # POST /character_races
  # POST /character_races.json
  def create
    @character_race = CharacterRace.new(params[:character_race])

    respond_to do |format|
      if @character_race.save
        format.html { redirect_to @character_race, notice: 'Character race was successfully created.' }
        format.json { render json: @character_race, status: :created, location: @character_race }
      else
        format.html { render action: "new" }
        format.json { render json: @character_race.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_races/1
  # PUT /character_races/1.json
  def update
    @character_race = CharacterRace.find(params[:id])

    respond_to do |format|
      if @character_race.update_attributes(params[:character_race])
        format.html { redirect_to @character_race, notice: 'Character race was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_race.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_races/1
  # DELETE /character_races/1.json
  def destroy
    @character_race = CharacterRace.find(params[:id])
    @character_race.destroy

    respond_to do |format|
      format.html { redirect_to character_races_url }
      format.json { head :no_content }
    end
  end
end
