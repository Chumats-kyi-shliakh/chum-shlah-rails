RSpec.describe Delivery, type: :model do
  describe "initial test" do
    subject { create(:delivery) }

    it { is_expected.to be_persisted }
  end
end
