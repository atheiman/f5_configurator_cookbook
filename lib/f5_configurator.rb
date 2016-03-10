chef_gem 'rest-client'
require 'rest-client'

module F5Config
  class F5Configurator
    def initialize api_base_url
      # api_base_url example: "https://10.11.12.13/mgmt/tm/"
      @api_base_url = api_base_url
    end

    def send_request meth, endpoint, data
      resp = RestClient.method(meth).call(@api_base_url + endpoint,
                                          data,
                                          :content_type => :json)
      resp_handler resp
    end

    def resp_handler resp
      puts "Response code: #{resp.code}"
      puts "Response body: #{resp.body}"
    end

    def create f5_obj
      send_request 'get', f5_obj.endpoint, f5_obj.properties.to_json
    end

    def update f5_obj
      send_request 'put', f5_obj.endpoint, f5_obj.properties.to_json
    end

    def delete f5_obj
      send_request 'post', f5_obj.endpoint, f5_obj.properties.to_json
    end
  end
end
