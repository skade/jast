require "jast/version"
require "jast/schema_renderer"

module Jast
  class Generator
    attr_accessor :api_version, :base_path, :definitions_path

    def initialize api_version: 1, base_path: nil
      @api_version = api_version
      @base_path = base_path.nil? ? "spec/support/api/schemas/v#{api_version}/" : base_path
    end

    def render_schemas name, properties, required
      schema_renderer = Jast::SchemaRenderer.new name, base_path
      schema_renderer.render_resource properties, required
    end
  end
end
