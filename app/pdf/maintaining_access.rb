module MaintainingAccess

  def generate(helper, opts)
    @helper = helper
    @maintaining_access_text = opts[:maintaining_access] || default_maintaining_access_text
    recipe
  end

  def recipe
    @helper.section(self, "Maintaining Access")
    move_down 20

    @helper.text(self, @maintaining_access_text)
  end

  private

  def default_maintaining_access_text
    <<-EOF
    Maintaining access to a system is important to us as attackers, ensuring that we can get back into a system after it has been exploited is invaluable. The maintaining access phase of the penetration test focuses on ensuring that once the focused attack has occurred (i.e. a buffer overflow), we have administrative access over the system again. Many exploits may only be exploitable once and we may never be able to get back into a system after we have already performed the exploit.
    John added administrator and root level accounts on all systems compromised. In addition to the administrative/root access, a Metasploit meterpreter service was installed on the machine to ensure that additional access could be established.
    EOF
  end
end
