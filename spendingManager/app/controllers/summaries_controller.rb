class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /summaries
  # GET /summaries.json
  def index
    @summaries = Summary.all
    @accounts = Account.all

    dailyTotals = DailyTotal.all
    monthlyTotals = MonthlyTotal.all

    # Calculating the monthly total by adding daily total values
    monthlyTotals.each { |mt|
      dailyTotals.each { |dt|
        if dt.date.year == mt.year && dt.date.month == mt.month
          mt.total += dt.total
        end
      } # end of inner dailyTotal loop
    } # end of monthlyTotal loop

    # For linechart to display monthly total spendings
    mTotals = Array.new
    monthlyTotals.each { |mt|
      case mt.month
      when 1
        mTotals.push(["January",mt.total.to_f])
      when 2
        mTotals.push(["February",mt.total.to_f])
      when 3
        mTotals.push(["March",mt.total.to_f])
      when 4
        mTotals.push(["April",mt.total.to_f])
      when 5
        mTotals.push(["May",mt.total.to_f])
      when 6
        mTotals.push(["June",mt.total.to_f])
      when 7
        mTotals.push(["July",mt.total.to_f])
      when 8
        mTotals.push(["August",mt.total.to_f])
      when 9
        mTotals.push(["September",mt.total.to_f])
      when 10
        mTotals.push(["October",mt.total.to_f])
      when 11
        mTotals.push(["November",mt.total.to_f])
      when 12
        mTotals.push(["December",mt.total.to_f])
      end
    }
    gon.mTotals = mTotals

    balanceSummary = Array.new
    @accounts.each { |account|
      balanceSummary.push ([account.name,account.balance.to_f])
    }
    gon.balanceSummary = balanceSummary
  end

  # GET /summaries/1
  # GET /summaries/1.json
  def show
  end

  # GET /summaries/new
  def new
    @summary = Summary.new
  end

  # GET /summaries/1/edit
  def edit
  end

  # POST /summaries
  # POST /summaries.json
  def create
    @summary = Summary.new(summary_params)

    respond_to do |format|
      if @summary.save
        format.html { redirect_to @summary, notice: 'Summary was successfully created.' }
        format.json { render :show, status: :created, location: @summary }
      else
        format.html { render :new }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summaries/1
  # PATCH/PUT /summaries/1.json
  def update
    respond_to do |format|
      if @summary.update(summary_params)
        format.html { redirect_to @summary, notice: 'Summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @summary }
      else
        format.html { render :edit }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.json
  def destroy
    @summary.destroy
    respond_to do |format|
      format.html { redirect_to summaries_url, notice: 'Summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_params
      params.require(:summary).permit(:bank_id)
    end
end
