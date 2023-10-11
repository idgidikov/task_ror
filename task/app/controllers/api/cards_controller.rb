class Api::CardsController < ApplicationController
    def show
      card = Card.find_by(id: params[:id], status: 'issued')
  
      if card
        render json: {
          id: card.id,
          amount: card.amount,
          status: card.status,
          activation_number: card.activation_number,
          transaction: card.transaction,
          reference_number: card.reference_number,
          amount: card.amount
        }
    render 'api/cards/show'
      else
        render json: { error: 'No issued card found with the given ID' }, status: :not_found
      end
    end
  end
  