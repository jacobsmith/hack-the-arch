module AdditionalItems
  def generate(helper, opts)
    @helper = helper
    @additional_items_text = opts[:additional_items] || default_additional_items_text
    recipe
  end

  def recipe
    @helper.section(self, "Additional Items Not Mentioned in the Report")
    move_down 20
    @helper.text(self, @additional_items_text)
  end

  private

  def default_additional_items_text
    <<-EOF
    This section is placed for any additional items that were not mentioned in the overall report.
    EOF
  end
end
