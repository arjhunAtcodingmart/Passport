class ApplicantDetail < ApplicationRecord
    has_many :family_details, class_name: "FamilyDetail", foreign_key: "applicant_id" , dependent: :destroy
    has_many :address_details, class_name: "AddressDetail", foreign_key: "applicant_id",  dependent: :destroy
    has_many :other_details, class_name: "OtherDetail", foreign_key: "applicant_id",  dependent: :destroy
    belongs_to :service, optional: true
end
