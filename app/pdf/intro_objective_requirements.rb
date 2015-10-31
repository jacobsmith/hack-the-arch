module IntroObjectiveRequirements
  def generate(helper, options = {})
    @helper = helper
    @introduction_text = options[:introduction] || default_introduction_text
    recipe
  end

  def recipe
    start_new_page
    @helper.section(self, "Lab and Exam Penetration Test Report")
    @helper.subsection(self, "Introduction")
    text @introduction_text
  end

  private

  def default_introduction_text
    <<-EOF
      The TS13 Lab and Exam penetration test report contains all efforts that were conducted in order to pass the TS13 course. This report should contain all lab data in the report template format as well as all items that were used to pass the overall exam. This report will be graded from a standpoint of correctness and fullness to all aspects of the lab and exam. The purpose of this report is to ensure that the student has a full understanding of penetration testing methodologies as well as the technical knowledge to safely and professionally conduct penetration testing.
    EOF
  end
end
