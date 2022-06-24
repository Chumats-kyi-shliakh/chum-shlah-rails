RSpec.describe Fund, type: :model do
  describe "initial test" do
    subject { create(:fund) }

    it { is_expected.to be_persisted }
  end
end
