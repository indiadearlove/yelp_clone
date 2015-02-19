require 'rails_helper'

describe ReviewsHelper, type: :helper do

  context 'star rating' do

    it 'does nothing if not a number' do
      expect(helper.star_rating('N/A')).to eq('N/A')
    end

    it 'returns five balck stars for five' do
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns three black stars and two white stars for three' do
      expect(helper.star_rating(3)).to eq '★★★☆☆'
    end

    it 'returns four black stars and one white star for 3.5' do
      expect(helper.star_rating(3.5)).to eq "★★★★☆"
    end

  end

  context 'time stamp' do

    it 'shows minutes since made when less then hour' do
      review = Review.new(rating: 1)
      Timecop.travel((10*60))
      expect(helper.time_since).to eq "10 minutes ago"
    end

  end

end
