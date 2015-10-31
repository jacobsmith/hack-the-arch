class ReportHelper
  attr_accessor :section_number

  def initialize
    @section_number = 0
    @subsection_number = 0
  end

  def section(pdf, content)
      @section_number += 1
      @subsection_number = 0
      pdf.text "<u>#{section_subsection} #{content}</u>", size: 20, inline_format: true
  end

  def subsection(pdf, content)
    @subsection_number += 1
    pdf.move_down 20
    pdf.text "#{section_subsection} #{content}", size: 16
    pdf.move_down 20
  end

  private

  def section_subsection
    "#{@section_number}.#{@subsection_number}"
  end
end
