module HighLevelSummary

  def generate(helper, opts)
    @helper = helper
    @high_level_summary_text = opts[:high_level_summary] || default_objective_text
    @recommendations_text = opts[:recommendations] || default_recommendations_text
    recipe
  end

  def recipe
    @helper.section(self, "High-Level Summary")
    move_down 20

    @helper.text(self, @high_level_summary_text)

    @helper.subsection(self, "Recommendations")
    @helper.text(self, @recommendations_text)
  end

  private

  def default_objective_text
    <<-EOF
    John Doe was tasked with performing an internal penetration test towards TS13 internal lab. An internal penetration test is a dedicated attack against internally connected systems. The focus of this test is to perform attacks, similar to those of a hacker and attempt to infiltrate TS13 internal lab systems – the THINC.local domain. John’s overall objective was to evaluate the network, identify systems, and exploit flaws while reporting the findings back to TS13 Lab Admin.
    When performing the internal penetration test, there were several alarming vulnerabilities that were identified on TS13 Test network. When performing the attacks, John was able to gain access to multiple machines, primarily due to outdated patches and poor security configurations.  During the testing, John had administrative level access to multiple systems. All systems were successfully exploited and access granted. These systems as well as a brief description on how access was obtained are listed below:
    <ul>
      <li>Lab Trophy 1 – Got in through X</li>
      <li>Lab Trophy 2 – Got in through X</li>
      <li>Lab Trophy 3 – Got in through X</li>
      <li>Exam Trophy 1 – Got in through X</li>
      <li>Exam Trophy 2 – Got in through X</li>
    </ul>
    EOF
  end

  def default_recommendations_text
    <<-EOF
      John recommends patching the vulnerabilities identified during the testing to ensure that an attacker cannot exploit these systems in the future. One thing to remember is that these systems require frequent patching and once patched, should remain on a regular patch program to protect additional vulnerabilities that are discovered at a later date.
    EOF
  end
end
