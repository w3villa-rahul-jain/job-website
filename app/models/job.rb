class Job < ApplicationRecord
    has_many :jobApplicants
    has_many :users, through: :jobApplicants


    def self.ransackable_attributes(auth_object = nil)
        ["description", "created_at", "id", "name", "updated_at"]
      end
end
