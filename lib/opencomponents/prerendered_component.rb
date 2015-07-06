module OpenComponents
  # Wrapper object for components using the `pre-rendered` rendering mode.
  class PrerenderedComponent < Component
    # Public: Returns a Hash of data to use when rendering the component.
    attr_reader :data

    # Public: Returns a Template with data for rendering the raw component.
    attr_reader :template

    # Public: Executes a request for the Component against the configured
    #   registry and sets the component attributes.
    #
    # Examples
    #
    #   component = OpenComponents::RenderedComponent.new('my-component')
    #   component.load
    #   # => #<OpenComponents::RenderedComponent: ... >
    #
    # Returns the Component with attributes set.
    def load
      template_data = response_data['template']

      @data     = response_data['data']
      @template = Template.new(
        template_data['src'], template_data['type'], template_data['key']
      )

      super
    end

    private

    # Internal: Returns the ACCEPT HTTP header used for requesting pre-rendered
    #   templates from a registry.
    def accept_header
      'application/vnd.oc.prerendered+json'
    end
  end
end
