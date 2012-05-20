class InsiderDataController < ApplicationController
  # GET /insider_data
  # GET /insider_data.json
  def index
    @insider_data = InsiderDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insider_data }
    end
  end

  # GET /insider_data/1
  # GET /insider_data/1.json
  def show
    @insider_datum = InsiderDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insider_datum }
    end
  end

  # GET /insider_data/new
  # GET /insider_data/new.json
  def new
    @insider_datum = InsiderDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insider_datum }
    end
  end

  # GET /insider_data/1/edit
  def edit
    @insider_datum = InsiderDatum.find(params[:id])
  end

  # POST /insider_data
  # POST /insider_data.json
  def create
    @insider_datum = InsiderDatum.new(params[:insider_datum])

    respond_to do |format|
      if @insider_datum.save
        format.html { redirect_to @insider_datum, notice: 'Insider datum was successfully created.' }
        format.json { render json: @insider_datum, status: :created, location: @insider_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @insider_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insider_data/1
  # PUT /insider_data/1.json
  def update
    @insider_datum = InsiderDatum.find(params[:id])

    respond_to do |format|
      if @insider_datum.update_attributes(params[:insider_datum])
        format.html { redirect_to @insider_datum, notice: 'Insider datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @insider_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insider_data/1
  # DELETE /insider_data/1.json
  def destroy
    @insider_datum = InsiderDatum.find(params[:id])
    @insider_datum.destroy

    respond_to do |format|
      format.html { redirect_to insider_data_url }
      format.json { head :no_content }
    end
  end

  # GET /insider_data/fetch
  def fetch
    if params[:id].blank?
      flash[:alert] = "No id was provided, cannot fetch."
    else
      datum = InsiderDatum.fetch(params[:type], params[:id])
      flash[:info] = "Fetched \"#{datum.name}\""
    end

    redirect_to insider_data_url
  end
end
