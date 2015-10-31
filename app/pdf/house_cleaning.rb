module HouseCleaning
  def generate(helper, opts)
    @helper = helper
    @house_cleaning_text = opts[:house_cleaning_text] || default_house_cleaning_text
    recipe
  end

  def recipe
    @helper.section(self, "House Cleaning")
    move_down 20

    @helper.text(self, @house_cleaning_text)
  end

  private

  def default_house_cleaning_text
    <<-EOF
    The house cleaning portions of the assessment ensures that remnants of the penetration test are removed. Often fragments of tools or user accounts are left on an organizations computer which can cause security issues down the road. Ensuring that we are meticulous and no remnants of our penetration test are left over is important.
    After the trophies on both the lab network and exam network were completed, John removed all user accounts and passwords as well as the Meterpreter services installed on the system.
    EOF
  end
end
