class Service < ApplicationRecord
    has_many :applicants_details, class_name: "ApplicantDetail", foreign_key: "service_id", dependent: :destroy
end