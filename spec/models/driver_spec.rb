RSpec.describe Driver, type: :model do
  describe "initial test" do
    subject { create(:driver) }

    it { is_expected.to be_persisted }
  end
end
