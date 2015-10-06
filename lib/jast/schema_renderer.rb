require "erb"

module Jast
  class SchemaRenderer
    def initialize name, path
      @name = name
      @path = path
    end

    def build_json file, properties = {}, required = []
      filename = "#{file}.json.erb"
      template_path = "#{File.expand_path(File.dirname(__FILE__))}/templates/#{filename}"
      ERB.new(File.read(template_path), nil, ">").result(binding)
    end

    def render_definition properties, required
      render_file :definition, {path: "#{@path}definitions/", properties: properties, required: required, filename: @name}
    end

    def render_file file, options = {}
      content = build_json(file, options[:properties], options[:required])
      path = options[:path].nil? ? @path : options[:path]
      FileUtils.mkdir_p(path)
      filename = options[:filename].nil? ? "#{@name}_#{file}.json" : options[:filename]
      IO.write("#{path}#{@name}.json", content)
    end

    def render_list_response
      render_file :list_response
    end

    def render_resource properties, required
      render_definition(properties, required)
      render_list_response
      render_response
    end

    def render_response
      render_file :response
    end
  end
end