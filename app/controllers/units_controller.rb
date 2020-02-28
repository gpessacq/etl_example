require 'etl'
class UnitsController < ApplicationController
  before_action :set_unit, only: [:show]

  def index
    @units = Unit.all
  end

  def show
  end

  def extract_units
    organizer_call = EtlService.call(end_point: ENV['END_POINT'])
    if organizer_call.failure?
      flash.notice =  "There was a problem in the ETL process"
      redirect_to units_path
    else
      flash.notice = "ETL process executed correctly"
      redirect_to units_path
    end  
  end

  private

  def set_unit
    @unit = Unit.find(params[:id])
  end

end
