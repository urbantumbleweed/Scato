require 'spec_helper'

describe Pattern do

	describe "getting the pattern_id" do
		before do
			@p = Pattern.create(name: "Doji",
										pattern_type: "single candle",
										description: "The doji is a single candle pattern that occurs when the open and close are the same or nearly the same.  The range between the high and low should be at least 4.5 times greater than the absolute distance between the open and the close.",
										historical_target_reaching_strength: 70,
										historical_directional_reliability:  85,
										historical_rarity_ranking: 650)
		end

	end



end