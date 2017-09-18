class BreakdownsController < ApplicationController
  before_action :set_breakdown, only: [:show, :edit, :update, :destroy]

  # GET /breakdowns
  # GET /breakdowns.json
  def index
    @breakdowns = Breakdown.all
  end

  # GET /breakdowns/1
  # GET /breakdowns/1.json
  def show
  end

  # GET /breakdowns/new
  def new
    @breakdown = Breakdown.new
  end

  # GET /breakdowns/1/edit
  def edit
  end

  # POST /breakdowns
  # POST /breakdowns.json
  def create
    @breakdown = Breakdown.new(breakdown_params)

    respond_to do |format|
      if @breakdown.save
        format.html { redirect_to @breakdown, notice: 'Breakdown was successfully created.' }
        format.json { render :show, status: :created, location: @breakdown }
      else
        format.html { render :new }
        format.json { render json: @breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breakdowns/1
  # PATCH/PUT /breakdowns/1.json
  def update
    respond_to do |format|
      if @breakdown.update(breakdown_params)
        format.html { redirect_to @breakdown, notice: 'Breakdown was successfully updated.' }
        format.json { render :show, status: :ok, location: @breakdown }
      else
        format.html { render :edit }
        format.json { render json: @breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breakdowns/1
  # DELETE /breakdowns/1.json
  def destroy
    @breakdown.destroy
    respond_to do |format|
      format.html { redirect_to breakdowns_url, notice: 'Breakdown was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breakdown
      @breakdown = Breakdown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breakdown_params
      params.require(:breakdown).permit(:date, :content, :amount, :currentBalance, :account)
    end
end