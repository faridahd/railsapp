class ListitemsController < ApplicationController
  before_action :set_listitem, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /listitems or /listitems.json
  def index
    @listitems = Listitem.all
  end

  # GET /listitems/1 or /listitems/1.json
  def show
  end

  # GET /listitems/new
  def new
    #@listitem = Listitem.new
    @listitem = current_user.listitems.build
  end

  # GET /listitems/1/edit
  def edit
  end

  # POST /listitems or /listitems.json
  def create
    #@listitem = Listitem.new(listitem_params)
    @listitem = current_user.listitems.build(listitem_params)
    respond_to do |format|
      if @listitem.save
        format.html { redirect_to @listitem, notice: "Listitem was successfully created." }
        format.json { render :show, status: :created, location: @listitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listitems/1 or /listitems/1.json
  def update
    respond_to do |format|
      if @listitem.update(listitem_params)
        format.html { redirect_to @listitem, notice: "Listitem was successfully updated." }
        format.json { render :show, status: :ok, location: @listitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listitems/1 or /listitems/1.json
  def destroy
    @listitem.destroy
    respond_to do |format|
      format.html { redirect_to listitems_url, notice: "Listitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @listitem  = current_user.listitems.find_by(id: params[:id])
    redirect_to listitems_path, notice: "Not Authorized To Edit This Item" if @listitem.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listitem
      @listitem = Listitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listitem_params
      params.require(:listitem).permit(:item_name, :item_count, :item_description, :user_id)
    end
end
