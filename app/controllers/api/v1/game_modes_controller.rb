class Api::V1::GameModesController < Api::V1::ApiController
  def index
    @game_modes = GameMode.all
    render json: format(@game_modes), status: :ok
  end

  private

  def format(res)
    res.map do |gm|
      {
        ads_count: gm.ads.size,
        id: gm.id,
        name: gm.name
      }
    end
  end
end
