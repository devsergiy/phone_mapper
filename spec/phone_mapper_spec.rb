require "spec_helper"

RSpec.describe PhoneMapper do
  it "has a version number" do
    expect(PhoneMapper::VERSION).not_to be nil
  end

  shared_examples 'good mapper' do
    it 'finds proper matches' do
      result.each do |res|
        expect(PhoneMapper.lookup(phone)).to include(res)
      end
    end
  end

  context 'differrent data' do
    context 'phone 6686787825' do
      let(:phone) { '6686787825' }
      let(:result) do
        [
          ["MOTOR", "USUAL"],
          ["NOUN", "STRUCK"],
          ["NOUNS", "TRUCK"],
          ["NOUNS", "USUAL"],
          ["ONTO", "STRUCK"],
          "MOTORTRUCK"
        ]
      end

      it_behaves_like 'good mapper'

      it 'skips partial matches' do
        expect(PhoneMapper.lookup(phone)).not_to include(["NOUN", "PUPU"])
      end
    end

    context 'phone 2282668687' do
      let(:phone) { '2282668687' }
      let(:result) do
        [
          ["ACT", "AMOUNTS"],
          ["ACT", "CONTOUR"],
          ["ACTA", "MOUNTS"],
          ["BAT", "AMOUNTS"],
          ["BAT", "CONTOUR"],
          ["CAT", "CONTOUR"],
          "CATAMOUNTS"
        ]
      end

      it_behaves_like 'good mapper'
    end
  end
end
