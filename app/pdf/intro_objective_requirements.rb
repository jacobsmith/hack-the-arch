module IntroObjectiveRequirements
  def generate(helper, options = {})
    @helper = helper
    @introduction_text = options[:introduction] || default_introduction_text
    @objective_text = options[:objective] || default_objective_text
    @requirements_text = options[:requirements] || default_requirements_text
    recipe
  end

  def recipe
    @helper.section(self, "Lab and Exam Penetration Test Report")

    @helper.subsection(self, "Introduction")
    @helper.text(self, @introduction_text)

    @helper.subsection(self, "Objective")
    @helper.text(self, @objective_text)

    @helper.subsection(self, "Requirements")
    @helper.text(self, @requirements_text)
      bullet_item('Overall High-Level Summary and Recommendations (non-technical)')
      bullet_item('Methodology walkthrough and detailed outline of steps taken')
      bullet_item('Each finding with included screenshots, walkthrough, sample code, and proof.txt if applicable.')
      bullet_item('Any additional items that were not included')
  end

  private

  def default_introduction_text
    <<-EOF
      The TS13 Lab and Exam penetration test report contains all efforts that were conducted in order to pass the TS13 course. This report should contain all lab data in the report template format as well as all items that were used to pass the overall exam. This report will be graded from a standpoint of correctness and fullness to all aspects of the lab and exam. The purpose of this report is to ensure that the student has a full understanding of penetration testing methodologies as well as the technical knowledge to safely and professionally conduct penetration testing.
    EOF
  end

  def default_objective_text
    <<-EOF
      The objective of this assessment is to perform an internal penetration test against the TS13 Lab and Exam network. The student is tasked with following methodical approach in obtaining access to the objective goals. This test should simulate an actual penetration test and how you would start from beginning to end, including the overall report. An example page has already been created for you at the latter portions of this document that should give you ample information on what is expected to pass this course. Use the sample report as a guideline to get you through the reporting.
    EOF
  end

  def default_requirements_text
    <<-EOF
      The student will be required to fill out this penetration testing report fully and to include the following sections:
    EOF
  end

  def bullet_item(string, level = 1)
    indent (15 * level), 0 do
      text "• " + string
    end
  end
end
