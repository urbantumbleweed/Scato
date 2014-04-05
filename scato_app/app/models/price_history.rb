class PriceHistory < ActiveRecord::Base
	belongs_to :ticker
	validates :ticker_id, :date, :open, :high, :low, :close, :volume, presence: true
	validates :open, :high, :low, :close, numericality: { greater_than_or_equal_to: 0 }
	validates :volume, numericality: { only_integer: true}

def self.get_activity(ticker)
	return PriceHistory.where("date = ? AND ticker_id = ?", ticker.date, ticker.id).first
end

end