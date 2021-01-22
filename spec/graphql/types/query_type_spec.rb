require "rails_helper"

RSpec.describe Types::QueryType do
  describe "images" do
    let!(:images) { create_pair(:image) }

    let(:query) do
      %(query {
        images {
          title
        }
      })
    end

    subject(:result) do
      MartianLibrarySchema.execute(query).as_json
    end

    it "returns all images" do
      expect(result.dig("data", "images")).to match_array(
                                               images.map { |image| { "title" => image.title } }
                                             )
    end
  end
end
