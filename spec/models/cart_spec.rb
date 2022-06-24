RSpec.describe Cart, type: :model do
  describe "initial test" do
    subject { create(:cart) }

    it { is_expected.to be_persisted }
  end
end
