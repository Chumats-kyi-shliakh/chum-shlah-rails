RSpec.describe Storage, type: :model do
  describe "initial test" do
    subject { create(:storage) }

    it { is_expected.to be_persisted }
  end
end
