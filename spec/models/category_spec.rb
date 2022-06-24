RSpec.describe Category, type: :model do
  describe "initial test" do
    subject { create(:category) }

    it { is_expected.to be_persisted }
  end
end
