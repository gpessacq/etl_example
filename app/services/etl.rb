class Etl
  extend LightService::Organizer

  def self.call(api_server:)
    with(api_server: api_server).reduce(
      ::Actions::UnitApiCall,
      ::Actions::CleanUnitsFromApi,
      ::Actions::InsertUnits
    )
  end
end