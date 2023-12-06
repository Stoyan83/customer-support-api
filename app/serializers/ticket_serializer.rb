# frozen_string_literal: true

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
