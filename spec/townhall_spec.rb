require_relative '../lib/Townhall'

describe "connection works?" do
  describe "get townhall name" do
    it "should got name" do
      expect(test_connection).to eq("ABLEIGES")
    end
  end
end
