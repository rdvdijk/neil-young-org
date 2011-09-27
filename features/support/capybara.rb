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

World capybara
