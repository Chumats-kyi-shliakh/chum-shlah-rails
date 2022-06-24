RSpec.describe CustomerOrder, type: :model do
  describe "initial test" do
    subject { create(:customer_order) }

    it { is_expected.to be_persisted }
  end
end
