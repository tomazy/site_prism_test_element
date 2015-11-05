require 'spec_helper'

describe SitePrismTestElement do
  it 'has a version number' do
    expect(SitePrismTestElement::VERSION).not_to be nil
  end

  describe ":test_element" do
    let(:string) do
      Capybara.string <<-STRING
        <html>
          <head>
            <title>simple_node</title>
          </head>
          <body>
            <div id="content">
              <h1 data-test-el="my_test_element">Totally awesome</h1>
              <p>Yes it is</p>
            </div>
          </body>
        </html>
      STRING
    end

    it "has the selector" do
      expect(string).to have_selector(:test_element, 'my_test_element')
    end

    it "finds the element" do
      expect{string.find(:test_element, 'my_test_element')}.not_to raise_error
    end

    describe "element" do
      let(:element) { string.find :test_element, 'my_test_element' }

      it "can access it's text" do
        expect(element.text).to eq('Totally awesome')
      end
    end
  end
end
