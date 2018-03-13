class Document < ApplicationRecord
  enum state: [:concept, :alpha, :beta, :draft, :publish]
end
