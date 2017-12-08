require 'gchart'

class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:show, :edit, :update, :destroy]

  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all

    dailyTotals = DailyTotal.all
    monthlyTotals = MonthlyTotal.all
    monthlyIncomes = MonthlyIncome.all
    breakdowns = Breakdown.all

    # Calculating the monthly spending total by sum up debit from breakdowns table
    monthlyTotals.each { |mt|
      breakdowns.each { |br|
        if br.activityType == "DEBIT"
          if br.date.year == mt.year && br.date.month == mt.month
            mt.total += br.debit
          end
        end
      } # end of inner dailyTotal loop
    } # end of monthlyTotal loop
    
    @mTotals = Array.new
    monthlyTotals.each { |mt|
      case mt.month
      when 1
        @mTotals.push(["January",mt.total.to_f])
      when 2
        @mTotals.push(["February",mt.total.to_f])
      when 3
        @mTotals.push(["March",mt.total.to_f])
      when 4
        @mTotals.push(["April",mt.total.to_f])
      when 5
        @mTotals.push(["May",mt.total.to_f])
      when 6
        @mTotals.push(["June",mt.total.to_f])
      when 7
        @mTotals.push(["July",mt.total.to_f])
      when 8
        @mTotals.push(["August",mt.total.to_f])
      when 9
        @mTotals.push(["September",mt.total.to_f])
      when 10
        @mTotals.push(["October",mt.total.to_f])
      when 11
        @mTotals.push(["November",mt.total.to_f])
      when 12
        @mTotals.push(["December",mt.total.to_f])
      end
    }

    # Calculating the monthly income total by sum up credit from breakdowns table
    monthlyIncomes.each { |mi|
      breakdowns.each { |br|
        if br.activityType == "CREDIT"
          if br.date.year == mi.year && br.date.month == mi.month
            mi.income += br.credit
          end
        end
      }
    } 

    @mIncomes = Array.new
    monthlyIncomes.each { |mi|
      case mi.month
      when 1
        @mIncomes.push(["January",mi.income.to_f])
      when 2
        @mIncomes.push(["February",mi.income.to_f])
      when 3
        @mIncomes.push(["March",mi.income.to_f])
      when 4
        @mIncomes.push(["April",mi.income.to_f])
      when 5
        @mIncomes.push(["May",mi.income.to_f])
      when 6
        @mIncomes.push(["June",mi.income.to_f])
      when 7
        @mIncomes.push(["July",mi.income.to_f])
      when 8
        @mIncomes.push(["August",mi.income.to_f])
      when 9
        @mIncomes.push(["September",mi.income.to_f])
      when 10
        @mIncomes.push(["October",mi.income.to_f])
      when 11
        @mIncomes.push(["November",mi.income.to_f])
      when 12
        @mIncomes.push(["December",mi.income.to_f])
      end
    }

    # Extracting only expenses types in order to remove "None" type, which considers to be a Credit
    @spendingTypes = {"Food" => 0, "Education" => 0, "Transportation" => 0, "Rent/Maintenance" => 0, "Travel" => 0, "Luxuries" => 0, "Other" => 0}
    breakdowns.each { |breakdown|
      if (breakdown.spendingType == "Food")
        @spendingTypes["Food"] += 1
      elsif (breakdown.spendingType == "Education")
        @spendingTypes["Education"] += 1
      elsif (breakdown.spendingType == "Transportation")
        @spendingTypes["Transportation"] += 1
      elsif (breakdown.spendingType == "Rent/Maintenance")
        @spendingTypes["Rent/Maintenance"] += 1
      elsif (breakdown.spendingType == "Travel")
        @spendingTypes["Travel"] += 1
      elsif (breakdown.spendingType == "Luxuries")
        @spendingTypes["Luxuries"] += 1
      elsif (breakdown.spendingType == "Travle")
        @spendingTypes["Other"] += 1
      end
    }

    @accounts = Account.all
    @acctSpendingHabit = Array.new
    @accounts.each { |account|
      @acctSpendingHabit.push ([account.id, account.name, 0.00])
    }

    @acctHabitforChart = Array.new
    @acctSpendingHabit.each { |ash|
      breakdowns.each { |br|
        if ash[0] == br.account_id
          ash[2] += br.debit.to_f
        end
      }
      @acctHabitforChart.push([ash[1],ash[2]])
    }
    
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
  end

  # GET /statistics/new
  def new
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: 'Statistic was successfully created.' }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1
  # PATCH/PUT /statistics/1.json
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistic_params
      params.require(:statistic).permit(:daily_total_id)
    end
end
