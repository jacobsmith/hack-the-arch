class Report < ActiveRecord::Base
  serialize :options, Hash
  belongs_to :user

  def self.severity_levels
    {
      'CRITICAL': :critical,
      'HIGH': :high,
      'MEDIUM': :medium,
      'LOW': :low,
      'NOTE': :note
    }
  end
end
