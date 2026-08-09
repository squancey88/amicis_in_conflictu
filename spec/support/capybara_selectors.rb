Capybara.add_selector(:testid) do
  css { |value| "[data-testid='#{value}']" }
end
