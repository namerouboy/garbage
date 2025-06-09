class UserGarbagePreference < ApplicationRecord
  belongs_to :user
  belongs_to :garbage_schedule
end
