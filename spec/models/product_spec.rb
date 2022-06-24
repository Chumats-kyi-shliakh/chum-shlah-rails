RSpec.describe Product, type: :model do
  describe "initial test" do
    subject { create(:product) }

    it { is_expected.to be_persisted }
  end
end
