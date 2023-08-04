class Api::V1::AdsController < Api::V1::ApiController
  def create
    @ad = Ad.new(ad_params)
    render json: format(@ad), status: :created if @ad.save!
  end

  def index
  end

  private

  def ad_params
    params.require(:ad).permit(:game_mode, :platform, :platform_indentification, :years_playing, :favorite_classes,
                               :hour_start, :hour_end, :voice_channel)
  end

  def format(res)
    res.as_json(except: %i[created_at updated_at])
  end
end
