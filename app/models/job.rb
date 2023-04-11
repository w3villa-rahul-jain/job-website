class Job < ApplicationRecord
    has_many :jobApplicants
    has_many :users, through: :jobApplicants
end
