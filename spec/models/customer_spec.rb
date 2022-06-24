RSpec.describe Customer, type: :model do
  describe "initial test" do
    subject { create(:customer) }

    it { is_expected.to be_persisted }
  end
end
