require 'rspec'
require 'jast/schema_renderer'

describe Jast::SchemaRenderer do
  let(:schema_renderer) {Jast::SchemaRenderer.new("test", "/tmp/schema_test/")}

  describe :render_resource do
    it 'renders a definition and schemas for list and single object responses' do
      expect(schema_renderer).to receive(:render_definition)
      expect(schema_renderer).to receive(:render_list_response)
      expect(schema_renderer).to receive(:render_response)
      schema_renderer.render_resource({name: :string}, ["name"])
    end
  end

  describe :build_json do
    it 'builds json from file' do
      definition = schema_renderer.build_json(:definition, {name: :string, bla: :foo}, ["name"])
      expect(definition).to include "test_attributes"
      expect(definition).to include "\"name\": { \"type\": \"string\" }"
      expect(definition).to include "\"bla\": { \"type\": \"foo\" }"
    end
  end

  describe :render_file do
    it 'renders a file at given path' do
      render_file = schema_renderer.render_file(:definition, {path: "/tmp/schema_test/definitions/", properties: {name: :string, bla: :foo}, required: ["name"], filename: "test.json"})
      expect(render_file).to be > 0
      expect(File.exists?("/tmp/schema_test/definitions/test.json")).to be_truthy
    end
  end
end