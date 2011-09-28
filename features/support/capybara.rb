capybara = Module.new do

  def submit_form
    find(".simple_form *[type=submit]").click
  end

  def field_with_errors(label)
    rows = page.all(".field_with_errors")
    found = rows.find { |row|
      label_node = row.find("label")
      begin
        field = row.find_field label
      rescue
        # field not found
      end
    }
    found
  end

end

class Capybara::Session

  def has_simple_form?(action)
    has_selector?("form[action='#{action}']")
  end

end

World capybara
