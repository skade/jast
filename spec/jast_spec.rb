require 'spec_helper'

describe Jast do
  it 'has a version number' do
    expect(Jast::VERSION).not_to be nil
  end

  describe Jast::Generator do
    let(:jast) {Jast::Generator.new}

    describe :initialize do
      it {expect(jast.api_version).to eq 1}
      it {expect(jast.base_path).to eq "spec/support/api/schemas/v1/"}
    end

    describe :render_schemas do
      let(:schema_renderer) {double("schema_renderer")}

      it 'renders all schemas' do
        allow(Jast::SchemaRenderer).to receive(:new).and_return schema_renderer
        expect(schema_renderer).to receive(:render_resource)
        jast.render_schemas "test", {name: :string, bla: :foo}, ["name"]
      end
    end
  end
end
