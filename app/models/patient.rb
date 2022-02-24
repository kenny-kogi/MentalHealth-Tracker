class Patient < ApplicationRecord
    has_secure_password
    belongs_to :therapist
    has_many :moods, dependent: :destroy

    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :firstName, presence: true
    validates :lastName, presence: true
end
