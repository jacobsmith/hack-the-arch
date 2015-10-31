class Report
    include Prawn::View
    attr_accessor :pdf, :opts

    def initialize
      @pdf = Prawn::Document.new
    end

    def set_options(opts)
      @opts = opts
    end

    def generate!
      @pdf.extend(CoverPage).generate(@opts) # student_name
      @pdf.render_file "/Users/jacobsmith/test.pdf"
      @pdf.render
    end
end
