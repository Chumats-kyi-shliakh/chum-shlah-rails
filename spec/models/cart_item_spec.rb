RSpec.describe CartItem, type: :model do
  describe "initial test" do
    subject { create(:cart_item) }

    it { is_expected.to be_persisted }
  end
end
