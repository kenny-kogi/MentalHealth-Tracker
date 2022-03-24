class Medication < ApplicationRecord
    belongs_to :patient

    validates :drug_name, presence: true
    validates :prescription, presence: true 
end
