Capybara.add_selector(:testid) do
  css { |value| "[data-test-id='#{value}']" }
end
