# modeled after http://www.yoniweisbrod.com/generating-complex-pdf-documents-in-rails-with-prawn/
class Report
    include Prawn::View

    attr_accessor :pdf, :opts

    def initialize
      @pdf = Prawn::Document.new
      @helper = ReportHelper.new
    end

    def set_options(opts)
      @opts = opts
    end

    def generate!
      @pdf.extend(CoverPage).generate(@opts) # student_name
      @pdf.extend(IntroObjectiveRequirements).generate(@helper, @opts) # introduction, objective, requirements
      @pdf.extend(HighLevelSummary).generate(@helper, @opts) # high_level_summary, recommendations
      @pdf.extend(Methodologies).generate(@helper, @opts)
      @pdf.render_file "/Users/jacobsmith/test.pdf"
      @pdf.render
    end
end
