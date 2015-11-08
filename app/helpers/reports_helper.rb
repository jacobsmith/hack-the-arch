module ReportsHelper
  def make_name_tag(field, vulnerability_id)
    "report[options][penetrations][#{vulnerability_id.to_s}][#{field}]"
  end
end
