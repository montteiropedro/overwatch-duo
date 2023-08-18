class Api::V1::AdsController < Api::V1::ApiController
  def index
    ads = Ad.all
    return render json: ads, status: :ok if ads.blank?

    formatted_ads = ads.map { |ad| format(ad) }
    render json: formatted_ads, status: :ok
  end

  def show
    @ad = Ad.find(params[:id])
    render json: format(@ad), status: :ok
  end

  def create
    @game_mode = GameMode.find_by(name: params[:ad][:game_mode])
    @user = User.find_by(discord_id: session[:discord]['id'])
    @ad = Ad.new(ad_params)
    @ad.game_mode = @game_mode
    @ad.user = @user
    render json: format(@ad), status: :created if @ad.save!
  end

  private

  def ad_params
    params.require(:ad).permit(:platform, :platform_indentification, :years_playing, :favorite_classes,
                               :user_rank, :hour_start, :hour_end, :voice_channel)
  end

  def format(res)
    {
      id: res.id, platform: res.platform, platform_indentification: res.platform_indentification,
      years_playing: res.years_playing, favorite_classes: res.favorite_classes,
      user_rank: res.user_rank, hour_start: res.hour_start, hour_end: res.hour_end,
      voice_channel: res.voice_channel, game_mode: res.game_mode.name
    }
  end
end
