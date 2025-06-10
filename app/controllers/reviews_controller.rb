class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create] # <-- S'exécute avant 'new' et 'create'

  def new
    @review = Review.new # Crée une nouvelle instance vide d'avis
  end

  def create
    @review = Review.new(review_params) # Crée un avis avec les données du formulaire
    @review.restaurant = @restaurant # <-- Associe l'avis au restaurant trouvé par set_restaurant

    if @review.save # Tente de sauvegarder l'avis. Les validations du modèle Review sont exécutées.
      redirect_to restaurant_path(@restaurant), notice: 'Avis ajouté avec succès !' # Redirige vers la page du restaurant
    else
      render 'restaurants/show', status: :unprocessable_entity # <-- Important : Réaffiche la vue show du restaurant
    end
  end

  private

  # Trouve le restaurant parent basé sur l'ID dans l'URL (via les routes imbriquées)
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # Sécurise les paramètres de l'avis
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
