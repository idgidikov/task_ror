class Api::IssueController < ApplicationController
    def create
      product_id = params[:product_id]
      reference_number = params[:reference_number]
  
      # Find an available card for the given product and reference number
      card = Card.find_by(product_id: product_id, reference_number: reference_number, status: 'available')
  
      if card
        card.update(status: 'issued')
  
        render json: {
          id: card.id,
          amount: card.amount,
          status: card.status,
          activation_number: card.activation_number,
          transaction: card.transaction,
          reference_number: card.reference_number,
          amount: card.amount
        }
      else
        render json: { error: 'No available card found for the given product and reference number' }, status: :unprocessable_entity
      end
    end
  end