class FamilyDetail < ApplicationRecord
    belongs_to :applicant_detail, optional: true
end
