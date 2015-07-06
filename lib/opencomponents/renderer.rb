module OpenComponents
  # Provides rendering helper methods for components.
  module Renderer
    # Public: Builds a new RenderedComponent, executes a request for it against
    #   the configured registry, and returns the rendered component HTML.
    #
    # component - The String name of the component to render.
    # params    - A Hash of parameters to send in the component request
    #   (default: {}).
    # version   - The String version of the component to render (default: '').
    def render_component(component, params = {}, version = '')
      OpenComponents::RenderedComponent.new(component, params, version)
        .load
        .html
    end
  end
end
