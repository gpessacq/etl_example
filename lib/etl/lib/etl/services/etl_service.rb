# require_relative '../actions/utils'
require_relative "../actions/clean_units_from_api"
require_relative "../actions/insert_units"
require_relative "../actions/unit_api_call"

class EtlService
  extend LightService::Organizer

  def self.call(base_url:)
    with(base_url: base_url).reduce(
      UnitApiCall,
      CleanUnitsFromApi,
      InsertUnits
    )
  end
end