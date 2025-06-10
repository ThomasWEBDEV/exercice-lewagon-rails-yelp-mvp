class Review < ApplicationRecord
  # Association : un avis appartient à un restaurant
  belongs_to :restaurant
  # Validations
  validates :content, presence: true
  validates :rating, presence: true
  validates :restaurant, presence: true # <-- S'assurer qu'un avis est bien lié à un restaurant

  # Validations spécifiques pour la note (rating)
  validates :rating, numericality: {
    only_integer: true,                 # Doit être un entier
    greater_than_or_equal_to: 0,        # Doit être >= 0
    less_than_or_equal_to: 5            # Doit être <= 5
  }
end
