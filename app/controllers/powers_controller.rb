class PowersController < ApplicationController
  # GET /powers
  # GET /powers.json
  def index
    @powers = Power.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @powers }
    end
  end

  # GET /powers/1
  # GET /powers/1.json
  def show
    @power = Power.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @power }
    end
  end

  # GET /powers/new
  # GET /powers/new.json
  def new
    @power = Power.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @power }
    end
  end

  # GET /powers/1/edit
  def edit
    @power = Power.find(params[:id])
  end

  # POST /powers
  # POST /powers.json
  def create
    @power = Power.new(params[:power])

    respond_to do |format|
      if @power.save
        format.html { redirect_to @power, notice: 'Power was successfully created.' }
        format.json { render json: @power, status: :created, location: @power }
      else
        format.html { render action: "new" }
        format.json { render json: @power.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /powers/1
  # PUT /powers/1.json
  def update
    @power = Power.find(params[:id])

    respond_to do |format|
      if @power.update_attributes(params[:power])
        format.html { redirect_to @power, notice: 'Power was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @power.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /powers/1
  # DELETE /powers/1.json
  def destroy
    @power = Power.find(params[:id])
    @power.destroy

    respond_to do |format|
      format.html { redirect_to powers_url }
      format.json { head :no_content }
    end
  end
end
