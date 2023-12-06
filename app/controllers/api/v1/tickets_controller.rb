# frozen_string_literal: true

class Api::V1::TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @tickets = Ticket.all
    render json: @tickets, each_serializer: TicketSerializer
  end
end
