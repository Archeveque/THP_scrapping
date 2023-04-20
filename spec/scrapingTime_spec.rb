require_relative '../lib/scrapingTime'

describe "got crypto name?(check in connection works" do
    it "should return first on the list" do
      expect(test_crypto_name).to eq("Bitcoin")
    end
end
