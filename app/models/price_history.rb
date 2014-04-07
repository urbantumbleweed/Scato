class PriceHistory < ActiveRecord::Base
	belongs_to :ticker
	validates :ticker_id, :date, :open, :high, :low, :close, :volume, presence: true
	validates :open, :high, :low, :close, numericality: { greater_than_or_equal_to: 0 }
	validates :volume, numericality: { only_integer: true}

	#returns the PriceHistory object for a ticker on a given date. default date is self's current date.
	def self.get_activity(ticker_obj, date = ticker_obj.date)
		return PriceHistory.where("date = ? AND ticker_id = ?", date, ticker_obj.id).first
	end

	#returns a hash with open and close in terms of {higher, lower} float numbers
	def higher_lower_of_open_close_range
			if day.priceUp
			lower = day.open
			higher = day.close
		else 
			lower = day.close
			higher = day.open
		end
		return {higher: higher, lower: lower}
	end

	#returns the value equal to x-percent of the days trading range defined by constant
	def x_percent_of_range
		return self.day_range * Pattern::DOJI_OPEN_CLOSE_IN_MIDDLE_PERCENT_OF_DAY_RANGE
	end

	#returns half of the days trading range
	def half_range
		return (self.day_range / 2)
	end

	#returns the price at half of the days trading range
	def price_at_half_range
		return self.half_range + self.low
	end

	#returns a hash with the price at the high and low of the middle window
	def middle_window
		high = day.half_range + (day.x_percent_of_range / 2)
		low = day.half_range - (day.x_percent_of_range / 2)
		return {high: high, low: low}
	end

	#returns the number of times the open_close range fits into the high_low range
	def oc_hl_ratio
		return (self.day_range / self.open_close)
	end

end