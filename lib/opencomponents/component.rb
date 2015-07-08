module OpenComponents
  # Wrapper object for a component fetched from an OC registry.
  class Component
    # Public: Gets/sets the String name of the component.
    attr_accessor :name

    # Public: Gets/sets the desired String version of the component.
    attr_accessor :version

    # Public: Gets/sets a Hash of params to send in the component request.
    attr_accessor :params

    # Public: Gets/sets a Hash of headers to send in the component request.
    attr_accessor :headers

    # Public: Returns the String URL of the requested component.
    attr_reader :href

    # Public: Returns the String version of the component as served by the
    #   registry.
    attr_reader :registry_version

    # Public: Returns the String type of the component as served by the
    #   registry.
    attr_reader :type

    # Public: Returns the String render mode of the component as served by the
    #   registry. Generally either `rendered` or `pre-rendered`.
    attr_reader :render_mode

    # Public: Initializes a new Component subclass.
    #
    # name - The String name of the component to request.
    # opts - A Hash of options to use when requesting the component
    #   (default: {}).
    #        :params  - A Hash of parameters to send in the component request
    #          (optional, default: {}).
    #        :version - The String version of the component to request
    #          (optional, default: '').
    #        :headers - A Hash of HTTP request headers to include in the
    #          component request (optional, default: {}).
    def initialize(name, opts = {})
      @name    = name
      @params  = opts[:params]  || {}
      @version = opts[:version] || ''
      @headers = opts[:headers] || {}
    end

    # Public: Returns the String value of `requestVersion` from a component
    #   response, `nil` if not present.
    def request_version
      @request_version == '' ? nil : @request_version
    end

    # Public: Resets all component attributes from a registry response to `nil`.
    #
    # Examples
    #
    #   component.flush!
    #   # => #<OpenComponents::RenderedComponent: ... >
    #
    # Returns the reset Component.
    def flush!
      flush_variables_whitelist.each do |var|
        instance_variable_set(var, nil)
      end

      self
    end

    # Public: Resets all component attributes and reloads them from a registry
    #   response.
    #
    # Examples
    #
    #   component.reload!
    #   # => #<OpenComponents::RenderedComponent: ... >
    #
    # Returns the reloaded Component.
    def reload!
      flush!
      load
    end

    protected

    # Internal: Executes a component request and sets attributes common to all
    #   component render modes. Public-facing `#load` methods exist on Component
    #   subclasses.
    #
    # Returns the Component.
    def load
      @href             = response_data['href']
      @registry_version = response_data['version']
      @request_version  = response_data['requestVersion']
      @type             = response_data['type']
      @render_mode      = response_data['renderMode']

      self
    end

    # Internal: Builds the URL to send a component request to.
    #
    # Returns the String URL to request a component from.
    def url
      File.join(OpenComponents.config.registry, name, version)
    end

    # Internal: Executes a component request against the configured registry.
    #
    # Returns a response body String.
    # Raises OpenComponents::ComponentNotFound if the registry responds with a
    #   404.
    # Raises OpenComponents::RegistryTimeout if the request times out.
    def response
      request_headers = headers.merge(params: params)

      RestClient::Request.execute(
        method: :get,
        url: url,
        timeout: 10,
        headers: request_headers
      )
    rescue RestClient::ResourceNotFound => e
      fail ComponentNotFound, e.message
    rescue RestClient::RequestTimeout => e
      fail RegistryTimeout, e.message
    end

    # Internal: Helper method for converting and memoizing registry response
    #   data.
    #
    # Returns a Hash of registry response data.
    def response_data
      @_response_data ||= JSON.parse(response)
    end

    private

    # Internal: Whitelists instance variable names allowed to be reset when
    #   calling `#flush!`.
    #
    # Returns an Array of instance variable Symbols allowed to be reset.
    def flush_variables_whitelist
      instance_variables - [:@name, :@version, :@params, :@headers]
    end
  end
end
