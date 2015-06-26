module OpenComponents
  module Renderer
    def render_component(component, params = {}, version = '')
      OpenComponents::RenderedComponent.new(component, params, version)
        .load
        .html
    end
  end
end
