class Restaurant < ApplicationRecord
  # Association : un restaurant peut avoir plusieurs avis, et les détruit s'il est supprimé
  has_many :reviews, dependent: :destroy # <-- Cette ligne est importante pour la suppression en cascade !

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :phone_number, presence: true

  # Validation de la catégorie dans la liste fixe
  validates :category, inclusion: {
    in: ["chinese", "italian", "japanese", "french", "belgian"],
    message: "%{value} n'est pas une catégorie valide" # Message d'erreur personnalisé
  }
end
