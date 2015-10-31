module Methodologies

  def generate(helper, opts)
    @helper = helper
    @methodologies_overview_text = opts[:methodologies_overview] || default_methodologies_overview_text
    @information_gathering_text = opts[:information_gathering] || default_information_gathering_text
    @service_enumeration_text = opts[:service_enumeration] || default_service_enumerations_text
    @enumerations = opts[:enumerations] || default_enumerations
    recipe
  end

  def recipe
    @helper.section(self, "Methodologies")
    move_down 20
    @helper.text(self, @methodologies_overview_text)

    @helper.subsection(self, 'Information Gathering')
    @helper.text(self, @information_gathering_text)

    @helper.subsection(self, 'Service Enumeration')
    @helper.text(self, @service_enumeration_text)
    move_down 20
    make_service_enumeration_table(@enumerations)
  end

  private

  def make_service_enumeration_table(enumerations)
    table = [['Server IP Address', 'Ports Open']]
    enumerations.each do |findings|
      table += [[findings[:server], "TCP: #{findings[:tcp]}\nUDP: #{findings[:udp]}"]]
    end

    table(table, header: true)
  end

  def default_enumerations
    [
      {
        server: '192.168.1.1',
        tcp: '21, 22, 23',
        udp: '80, 443'
      },
      {
        server: '192.168.1.2',
        tcp: '21, 22, 25',
        udp: '80, 443, 1080, 8080'
      }

    ]
  end

  def default_methodologies_overview_text
    <<-EOF
      John utilized a widely adopted approach to performing penetration testing that is effective in testing how well the Offensive Security Labs and Exam environments are secure. Below is a breakout of how John was able to identify and exploit the variety of systems and includes all individual vulnerabilities found.
    EOF
  end

  def default_information_gathering_text
    <<-EOF
    The information gathering portion of a penetration test focuses on identifying the scope of the penetration test. During this penetration test, John was tasked with exploiting the lab and exam network. The specific IP addresses were:

    Lab Network

    <ul>
      <li>192.168.1.1</li>
      <li>192.168.1.2</li>
      <li>192.168.1.3</li>
    </ul>

    Exam Network

      <ul>
        <li>172.16.203.133</li>
        <li>172.16.203.134</li>
        <li>172.16.203.135</li>
        <li>172.16.203.136</li>
      </ul>
    EOF
  end

  def default_service_enumerations_text
    <<-EOF
      The service enumeration portion of a penetration test focuses on gathering information about what services are alive on a system or systems. This is valuable for an attacker as it provides detailed information on potential attack vectors into a system. Understanding what applications are running on the system gives an attacker needed information before performing the actual penetration test.  In some cases, some ports may not be listed.
    EOF
  end
end
