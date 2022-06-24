RSpec.describe DeliveryItem, type: :model do
  describe "initial test" do
    subject { create(:delivery_item) }

    it { is_expected.to be_persisted }
  end
end
