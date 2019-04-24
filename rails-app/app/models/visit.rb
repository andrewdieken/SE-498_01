class Visit < ApplicationRecord
  belongs_to :voter
  # Generate a CSV File of the Visits records
  def self.to_csv(fields = column_names, options={})
    CSV.generate(options) do |csv|
    csv << fields
    all.each do |visits|
      csv << visits.attributes.values_at(*fields)
    end
   end
  end
end
