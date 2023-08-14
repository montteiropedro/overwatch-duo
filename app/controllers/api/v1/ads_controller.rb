class Api::V1::AdsController < Api::V1::ApiController
  def index
    @ads = Ad.all
    render json: format(@ads), status: :ok
  end

  def show
    @ad = Ad.find(params[:id])
    render json: format(@ad), status: :ok
  end

  def create
    @game_mode = GameMode.find_by(name: params[:game_mode])
    @ad = Ad.new(ad_params)
    @ad.game_mode = @game_mode
    render json: format(@ad), status: :created if @ad.save!
  end

  private

  def ad_params
    params.require(:ad).permit(:platform, :platform_indentification, :years_playing, :favorite_classes,
                               :hour_start, :hour_end, :voice_channel)
  end

  def format(res)
    res.as_json(except: %i[created_at updated_at])
  end
end
