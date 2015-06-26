require 'rest-client'

module OpenComponents
  class Component
    attr_reader :name, :version, :params, :href, :registry_version,
                :type, :render_mode

    def initialize(name, params = {}, version = '')
      @name    = name
      @params  = params
      @version = version
    end

    def request_version
      @request_version == '' ? nil : @request_version
    end

    def flush!
      flush_variables_whitelist.each do |var|
        instance_variable_set(var, nil)
      end

      self
    end

    def reload!
      flush!
      load
    end

    protected

    def load
      @href             = response_data['href']
      @registry_version = response_data['version']
      @request_version  = response_data['requestVersion']
      @type             = response_data['type']
      @render_mode      = response_data['renderMode']

      self
    end

    def url
      File.join(OpenComponents.config.registry, name, version)
    end

    def response
      RestClient::Request.execute(
        method: :get,
        url: url,
        timeout: 10,
        headers: {
          accept: accept_header,
          params: params,
        }
      )
    rescue RestClient::ResourceNotFound => e
      fail ComponentNotFound, e.message
    end

    def response_data
      @_response_data ||= JSON.parse(response)
    end

    private

    def flush_variables_whitelist
      instance_variables - [:@name, :@version, :@params]
    end
  end
end
