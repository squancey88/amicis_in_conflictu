# spec/support/form_builder.rb
RSpec.configure do |config|
  config.before(:each, type: :helper) do
    # Makes helper specs use your custom builder by default
    ActionView::Base.default_form_builder = AICFormBuilder
  end

  config.after(:each, type: :helper) do
    ActionView::Base.default_form_builder = ActionView::Helpers::FormBuilder
  end
end
