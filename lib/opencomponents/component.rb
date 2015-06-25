require 'rest-client'

module OpenComponents
  class Component
    attr_accessor :name, :version, :params, :href, :version,
                  :request_version, :type, :render_mode

    def initialize(name, params = {}, version = '')
      @name    = name
      @params  = params
      @version = version
    end

    protected

    def load
      @href            = response_data['href']
      @version         = response_data['version']
      @request_version = response_data['requestVersion']
      @type            = response_data['type']
      @render_mode     = response_data['renderMode']

      self
    end

    def url
      File.join(OpenComponents.config.registry, name, version)
    end

    def response
      RestClient::Request.execute(
        method: :get,
        url: url,
        params: params,
        timeout: 10,
        headers: {
          accept: accept_header
        }
      )
    end

    def response_data
      @_response_data ||= JSON.parse(response)
    end
  end
end
