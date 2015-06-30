module OpenComponents
  module RailsRenderer
    include Renderer

    def render_component(component, params = {}, version = '')
      super(component, params, version).html_safe
    end
  end

  class Railtie < ::Rails::Railtie
    config.opencomponents = ActiveSupport::OrderedOptions.new

    initializer 'opencomponents.configure' do |app|
      OpenComponents.configure do |config|
        config.registry = app.config.opencomponents.registry ||
          OpenComponents::DEFAULT_REGISTRY
      end
    end

    initializer 'opencomponents.view_helpers' do
      ActionView::Base.send :include, OpenComponents::RailsRenderer
    end
  end
end
