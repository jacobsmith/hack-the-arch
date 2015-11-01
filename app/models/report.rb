class Report < ActiveRecord::Base
  serialize :options, Hash
end
