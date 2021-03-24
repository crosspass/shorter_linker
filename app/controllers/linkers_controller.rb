class LinkersController < ApplicationController
  before_action :set_linker, only: %i[edit update destroy toggle_status]
  skip_before_action :authenticate_user!, only: %i[new create edit show successful]

  # GET /linkers
  # GET /linkers.json
  def index
    @linkers = Linker.all
  end

  # GET /linkers/1
  # GET /linkers/1.json
  def show
    @linker = Linker.find_by(uid: params[:id])
  end

  # GET /linkers/new
  def new
    @linker = Linker.new
  end

  # GET /linkers/1/edit
  def edit
    @linker = Linker.find_by(uid: params[:id])
  end

  # POST /linkers
  # POST /linkers.json
  def create
    @linker = Linker.find_by(url: linker_params[:url], email: linker_params[:email])
    @linker ||= Linker.new(linker_params)

    respond_to do |format|
      if @linker.save
        format.html { redirect_to successful_path, notice: 'Linker was successfully created.' }
        format.json { render :show, status: :created, location: @linker }
      else
        format.html { render :new }
        format.json { render json: @linker.errors, status: :unprocessable_entity }
        format.js { render 'validate_form.js.erb' }
      end
    end
  end

  def successful; end

  # PATCH/PUT /linkers/1
  # PATCH/PUT /linkers/1.json
  def update
    respond_to do |format|
      if @linker.update(linker_params)
        format.html { redirect_to @linker, notice: 'Linker was successfully updated.' }
        format.json { render :show, status: :ok, location: @linker }
      else
        format.html { render :edit }
        format.json { render json: @linker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkers/1
  # DELETE /linkers/1.json
  def destroy
    @linker.destroy
    respond_to do |format|
      format.html { redirect_to linkers_url, notice: 'Linker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ##
  # PUT /likers/:id/toggle_status
  def toggle_status
    @linker.toggle_status
    render json: { message: 'ok' }
  end

  private

  def set_linker
    @linker = Linker.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def linker_params
    params.fetch(:linker, {}).permit(:url, :email)
  end
end
