class Mood < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :patient, optional: true

    validates :hours_slept, presence: true


  def created_at
    attributes['created_at'].strftime("%a %I:%M%p")
  end

end
