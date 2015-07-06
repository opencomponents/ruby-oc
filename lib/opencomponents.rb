require 'opencomponents/component'
require 'opencomponents/prerendered_component'
require 'opencomponents/rendered_component'
require 'opencomponents/renderer'
require 'opencomponents/version'

module OpenComponents
  # Public: Default OC registry URL (http://localhost:3030).
  DEFAULT_REGISTRY = 'http://localhost:3030'

  # Internal: Custom exception class to raise in the event a component cannot be
  #   found in the registry.
  ComponentNotFound = Class.new(RuntimeError)

  # Internal: Stores configuration data.
  #
  # registry - String for the registry host.
  Configuration = Struct.new(:registry)

  # Internal: Wrapper object for pre-rendered OC templates.
  #
  # src  - String for the template URL.
  # type - String for template engine type.
  # key  - String for template key.
  Template = Struct.new(:src, :type, :key)

  # Public: Getter for OC Configuration.
  #
  # Returns the Configuration if set, a default Configuration if not set.
  def self.config
    @@_config ||= Configuration.new(DEFAULT_REGISTRY)
  end

  # Public: Setter for Configuration.
  #
  # Examples
  #
  #   OpenComponents.configure do |oc|
  #     oc.registry = 'http://my-awesome-oc-registry.com'
  #   end
  #
  # Returns the Configuration.
  def self.configure
    yield self.config
  end
end
