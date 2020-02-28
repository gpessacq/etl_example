class UnitApiCall
  extend LightService::Action

  expects :base_url
  promises :result

  executed do |context|
    begin
      # Here I call examples_app where the data to be used in the etl process is extracted
      context.result = JSON.parse(RestClient.get("#{ENV['BASE_URL']}/#{ENV['END_POINT']}", {accept: :json}))
    rescue
      Rails.logger.info "***>>> Error calling the unit API @: #{ENV['BASE_URL']}/units.json"
      context.result = nil
      context.fail_and_return!("The call to the unit API failed")
    end
  end
end