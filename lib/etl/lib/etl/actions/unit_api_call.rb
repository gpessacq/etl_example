class UnitApiCall
  extend LightService::Action

  expects :end_point
  promises :result

  executed do |context|
    begin
      # Here I call examples_app where the data to be used in the etl process is extracted
      context.result = JSON.parse(RestClient.get("#{context.end_point}", {accept: :json}))
    rescue
      Rails.logger.info "***>>> Error calling the unit API @: #{context.end_point}"
      context.result = nil
      context.fail_and_return!("The call to the unit API failed")
    end
  end
end