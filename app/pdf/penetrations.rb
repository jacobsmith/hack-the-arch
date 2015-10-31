module Penetrations
  def generate(helper, opts)
    @helper = helper
    @penetrations = opts[:penetrations] || default_penetrations
    recipe
  end

  def recipe
    @helper.section(self, "Penetration")
    move_down 20

    @penetrations.each do |penetration|
      @helper.subsection(self, penetration[:vulnerability])
      text "<b>Vulnerability Exploited:</b> #{penetration[:vulnerability]}", inline_format: true
      move_down 20

      text "<b>System Vulnerable:</b> #{penetration[:system_vulnerable]}", inline_format: true
      move_down 20

      text "<b>Vulnerability Explanation:</b>", inline_format: true
      text "#{penetration[:vulnerability_explanation]}",  indent_paragraphs: 30
      move_down 20

      text "<b>Vulnerability Explanation:</b>", inline_format: true
      text "#{penetration[:vulnerability_fix]}", indent_paragraphs: 30  
      move_down 20

      text "<b>Severity:</b> #{get_severity_text(penetration[:severity])}", inline_format: true
      move_down 20

      text "<b>Proof of Concept Code:</b>", inline_format: true
      move_down 20
      text penetration[:proof_of_concept_code].gsub!(" ", "#{Prawn::Text::NBSP}"), font_family: "Courier", size: 12

      move_down 20
    end
  end

  private

  def get_severity_text(current_severity)
    severities = {
      critical: "<color rgb='#{get_rgb_color(:red)}'>CRITICAL</color>"
    }
    severities[current_severity]
  end

  def get_rgb_color(color)
    colors = { red: 'FF0000' }
    colors[color]
  end

  def default_penetrations
    [
      {
        vulnerability: 'Ability Server 2.34 FTP STOR Buffer Overflow',
        system_vulnerable: "172.16.203.134",
        vulnerability_explanation: "Ability Server 2.34 is subject to a buffer overflow vulnerability in STOR field. Attackers can use this vulnerability to cause arbitrary remote code execution and take completely control over the system. When performing the penetration test, John noticed an outdated version of Ability Server running from the service enumeration phase. In addition, the operating system was different from the known public exploit. A rewritten exploit was needed in order for successful code execution to occur. Once the exploit was rewritten, a targeted attack was performed on the system which gave John full administrative access over the system.",
        vulnerability_fix: "The publishers of the Ability Server have issued a patch to fix this known issue. It can be found here: http://www.code-crafters.com/abilityserver/",
        severity: :critical,
        proof_of_concept_code: "def testing\n  this should be indendted\nend"
      }
    ]
  end
end
