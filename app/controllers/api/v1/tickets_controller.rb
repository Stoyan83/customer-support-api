class Api::V1::TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @tickets = Ticket.all

    render json: {
      tickets: @tickets.map do |ticket|
        {
          id: ticket.id,
          title: ticket.name,
          description: ticket.description
        }
      end
    }
  end
end
