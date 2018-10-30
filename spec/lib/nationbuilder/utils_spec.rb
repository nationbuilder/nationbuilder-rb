require 'spec_helper'

describe NationBuilder::Utils::QueryParams do
  describe ".encode" do
    context "nested hash" do
      it "formats to proper url params hash" do
        expect(
          described_class.encode({ first: { second: { third: "value" } } })
        ).to eq({ "first[second][third]" => "value" })
      end
    end

    context "array" do
      it "formats to proper url params hash" do
        expect(described_class.encode(["tag"])).to eq({ "[]" => "tag" })
      end
    end

    context "nil" do
      it "formats to proper url params hash" do
        expect(described_class.encode(nil)).to eq({})
      end
    end
  end
end
