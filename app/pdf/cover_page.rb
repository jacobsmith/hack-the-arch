module CoverPage
  def generate(options = {})
    @student_name = options[:student_name]
    recipe
  end

  def recipe
    text "Penetration Test Report for Interal Lab and Exam", align: :center, size: 30
    stroke_horizontal_rule
    move_down 20
    text @student_name, align: :center, size: 18
    move_down 30
    image Rails.root.join('app', 'assets', 'images', 'mcpa-black.png'), fit: [450, 450], position: :center
  end
end
