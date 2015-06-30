require 'opencomponents/component'
require 'opencomponents/prerendered_component'
require 'opencomponents/rendered_component'
require 'opencomponents/renderer'
require 'opencomponents/version'

require 'opencomponents/railtie' if defined? Rails
require 'opencomponents/sinatra_helpers' if defined? Sinatra

module OpenComponents
  DEFAULT_REGISTRY = 'http://localhost:3030'

  ComponentNotFound = Class.new(RuntimeError)

  Configuration = Struct.new(:registry)
  Template      = Struct.new(:src, :type, :key)

  def self.config
    @@_config ||= Configuration.new(DEFAULT_REGISTRY)
  end

  def self.configure
    yield self.config
  end
end
