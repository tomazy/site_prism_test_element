require 'spec_helper'

class TestPage < SitePrism::Page

end

describe "SitePrism extensions" do
  describe SitePrism::Page do
    it { expect(described_class).to respond_to :test_element }
    it { expect(described_class).to respond_to :test_elements }
    it { expect(described_class).to respond_to :test_section }
    it { expect(described_class).to respond_to :test_sections }
  end

  describe SitePrism::Section do
    it { expect(described_class).to respond_to :test_element }
    it { expect(described_class).to respond_to :test_elements }
    it { expect(described_class).to respond_to :test_section }
    it { expect(described_class).to respond_to :test_sections }
  end
end
