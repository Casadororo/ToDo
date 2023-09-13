class BubblesController < ApplicationController
  before_action :set_bubble, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /bubbles or /bubbles.json
  def index
    @bubbles = current_user.bubbles
  end

  # GET /bubbles/1 or /bubbles/1.json
  def show
  end

  # GET /bubbles/new
  def new
    @bubble = current_user.bubbles.build
    @bubble.category_id = params[:category_id]
    @bubble.color = "#f8f9fa"
    @categories = current_user.categories
  end

  # GET /bubbles/1/edit
  def edit
    categories_controller = CategoriesController.new
    @categories = current_user.categories
  end

  # POST /bubbles or /bubbles.json
  def create
    @bubble = current_user.bubbles.build(bubble_params)

    respond_to do |format|
      if @bubble.save
        format.html { redirect_to categories_url, notice: "Bubble was successfully created." }
        format.json { render :show, status: :created, location: @bubble }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bubble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bubbles/1 or /bubbles/1.json
  def update
    respond_to do |format|
      if params[:value] == "delete"
        @bubble.destroy
        respond_to do |format|
          format.html { redirect_to categories_url, notice: "Bubble was successfully destroyed." }
          format.json { head :no_content }
        end
      else
        if @bubble.update(bubble_params)
          format.html { redirect_to categories_url, notice: "Bubble was successfully updated." }
          format.json { render :show, status: :ok, location: @bubble }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @bubble.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /bubbles/1 or /bubbles/1.json
  def destroy
    @bubble.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Bubble was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @bubble = current_user.bubbles.find_by(id: params[:id])
    redirect_to root_path, notice: "Not Authorized To Edit This Bubble" if @bubble.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bubble
    @bubble = Bubble.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bubble_params
    params.require(:bubble).permit(:name, :description, :priority, :category_id, :color, :date)
  end
end
