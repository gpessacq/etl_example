class Actions::UnitApiCall
  extend LightService::Action

  expects :api_server
  promises :result

  executed do |context|
    begin
      context.result = JSON.parse(RestClient.get("#{context.api_server}/units.json", {accept: :json}))
    rescue
      Rails.logger.info "***>>> Error calling the unit API @: #{ENV['API_SERVER']}/index.json"
      context.result = nil
      context.fail_and_return!("The call to the unit API failed")
    end
  end
end