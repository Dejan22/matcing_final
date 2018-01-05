class MatchesController < ApplicationController
    before_action :authenticate_user!
  def index
    @matches = Match.all
    @match = Match.new

  end



  def create
    day = params[:match][:day]
    matches_for_day = Match.select {|match| match.day == day.to_date}

    if matches_for_day.blank?
      create_matches(day)
    end
    redirect_to action: 'index'
  end

  def show
    @match = Match.find(params[:id])

  end

  def create_matches(day)
    @schedule = Pair.new.days
    @schedule.each do |k,v|
      Match.create!(day: day.to_date+k ,matches: v)
    end
  end


  private

  def match_params
    params.require(:match).permit(:day, :matches)
  end



end
