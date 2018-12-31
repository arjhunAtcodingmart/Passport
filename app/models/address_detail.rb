class AddressDetail < ApplicationRecord
    belongs_to :applicant_detail, optional: true
end
