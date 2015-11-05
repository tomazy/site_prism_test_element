# SitePrismTestElement

*Decouple your page objects from CSS*

Extension of [SitePrism](https://github.com/natritmeyer/site_prism)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_prism_test_element', groups: [:test]
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_prism_test_element

## Usage

Instead of using CSS classes/ids for selecting DOM elements, mark them with `data-test-el` attribute. You will not have to worry about breaking your feature specs when you rename a CSS class or id in your markup.

```html
<body>
  <div class="search-box">
    <form>
      <input type="text" name="q" data-test-el="search_field">
      <input type="submit" value="" data-test-el="submit_btn">
    </form>
  </div>

  <ul class="nav nav-menu" data-test-el="menu">
    <li>
      <a data-test-el="search">Search</a>
    </li>
    <li>
      <a data-test-el="map_search">Search</a>
    </li>
  </ul>

  <div class="assets">
    <div class="img">
      <img src="/assets/1.png" data-test-el="image">
    </div>
    <div class="img">
      <img src="/assets/2.png" data-test-el="image">
    </div>
    <div class="img">
      <img src="/assets/3.png" data-test-el="image">
    </div>
  </div>
</body>
```

```ruby
class HomePage < SitePrism::Page
  test_element :search_field
  test_element :submit_btn
  test_elements :images, :image

  test_section :menu, MenuSection
end

class MenuSection < SitePrism::Section
  test_element :search
  test_element :map_search
end
```

and in your spec you talk to the page as you normally do:

```ruby
  #...
  scenario "search" do
    home_page = HomePage.new

    expect(home_page.images.count).to eq(3)

    home_page.search_field.set "Harry Potter"
    home_page.submit_btn.click
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomazy/site_prism_test_element. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

