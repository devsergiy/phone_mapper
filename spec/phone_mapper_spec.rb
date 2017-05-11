require "spec_helper"

RSpec.describe PhoneMapper do
  it "has a version number" do
    expect(PhoneMapper::VERSION).not_to be nil
  end

  shared_examples 'good mapper' do
    it 'finds proper matches' do
      expect(PhoneMapper.lookup(phone)).to eq(result)
    end
  end

  context 'differrent data' do
    context 'phone 6686787825' do
      let(:phone) { 6686787825 }
      let(:result) do
        [
          ["motor", "usual"],
          ["noun", "struck"],
          ["nouns", "truck"],
          ["nouns", "usual"],
          ["onto", "struck"],
          "motortruck"
        ]
      end

      it_behaves_like 'good mapper'
    end

    context 'phone 2282668687' do
      let(:phone) { 2282668687 }
      let(:result) do
        [
          ["act", "amounts"],
          ["act", "contour"],
          ["acta", "mounts"],
          ["bat", "amounts"],
          ["bat", "contour"],
          ["cat", "contour"],
          "catamounts"
        ]
      end

      it_behaves_like 'good mapper'
    end
  end
end
