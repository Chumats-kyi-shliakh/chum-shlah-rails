RSpec.describe ProductAvailability, type: :model do
  describe "initial test" do
    subject { create(:product_availability) }

    it { is_expected.to be_persisted }
  end
end
