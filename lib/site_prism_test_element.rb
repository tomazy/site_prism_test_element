require "site_prism_test_element/version"
require "capybara"
require "site_prism"

Capybara.add_selector(:test_element) do
  xpath { |name| XPath.css("[data-test-el='#{name}']") }
end

module TestElement
  def test_element(name, matcher_name = nil)
    matcher_name ||= name
    element(name, :test_element, matcher_name.to_s)
  end

  def test_elements(name, matcher_name)
    elements(name, :test_element, matcher_name.to_s)
  end

  def test_section(section_name, section_class, matcher_name = nil)
    matcher_name ||= section_name
    section(section_name, section_class, :test_element, matcher_name.to_s)
  end

  def test_sections(section_name, section_class, matcher_name)
    sections(section_name, section_class, :test_element, matcher_name.to_s)
  end
end

class SitePrism::Page
  extend TestElement
end

class SitePrism::Section
  extend TestElement
end

module SitePrismTestElement
  # Your code goes here...
end
