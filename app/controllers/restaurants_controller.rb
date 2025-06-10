class RestaurantsController < ApplicationController
  def index # <-- definition de l'action index
    @restaurants = Restaurant.all # <-- Récupère tous les restaurants de la base de données
  end

  def show # <-- Nouvelle action : Affiche les détails d'un restaurant
    @restaurant = Restaurant.find(params[:id]) # Récupère le restaurant par son ID depuis l'URL
  end

  # Nouvelle action : Affiche le formulaire pour un nouveau restaurant
  def new
    @restaurant = Restaurant.new # Crée une instance vide de Restaurant
  end

  # Nouvelle action : Traite la soumission du formulaire
  def create
    @restaurant = Restaurant.new(restaurant_params) # Crée un restaurant avec les données du formulaire (voir private method en dessous)
    if @restaurant.save # Tente de sauvegarder le restaurant. Les validations sont exécutées ici.
      redirect_to restaurant_path(@restaurant) # Redirige vers la page de détail du restaurant si succès
    else
      render :new, status: :unprocessable_entity # Réaffiche le formulaire 'new' avec les erreurs si échec
    end
  end

  private # Les méthodes en dessous sont des méthodes auxiliaires, non des actions publiques

  # Méthode privée pour sécuriser les paramètres reçus du formulaire (Strong Parameters)
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
