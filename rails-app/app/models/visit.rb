class Visit < ApplicationRecord
  belongs_to :voter

  def self.to_csv(fields = column_names, options={})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |visit|
        csv << [
          visit.created_at,
          visit.updated_at,
          visit.voter.szNameFirst,
          visit.voter.szNameLast,
          visit.voter.szSitusAddress,
          visit.voter.szPhone,
          visit.voter.szEmailAddress,
          visit.voter.note
        ]
      end
    end
  end

end
