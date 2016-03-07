module OpenComponents
  # Provides rendering helper methods for components.
  module Renderer
    # Public: Builds a new RenderedComponent, executes a request for it against
    # the configured registry, and returns the rendered component HTML.
    #
    # component - The String name of the component to render.
    # opts - A Hash of options to use when requesting the component (default: {}):
    #        :params  - A Hash of parameters to send in the component request
    #        (optional, default: {}).
    #        :version - The String version of the component to request
    #        (optional, default: nil).
    #        :headers - A Hash of HTTP request headers to include in the component
    #        request (optional, default: {}).
    def render_component(component, opts = {})
      OpenComponents::RenderedComponent.new(component, opts)
        .load
        .html
    end
  end
end
