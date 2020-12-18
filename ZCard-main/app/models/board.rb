class Board < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4 }
  include AASM

  has_many :posts

  aasm(column: 'state', no_direct_assignment: true) do
    state :open, initial: true
    state :hidden, :locked

    event :hide do
      transitions from: :open, to: :hidden
      # send message
      # after do
      #   puts "hidden!!!!!!!!"
      # end
    end

    event :lock do
      transitions from: :open, to: :locked
    end

    event :open do
      transitions from: [:locked, :hidden], to: :open
    end
  end

end
