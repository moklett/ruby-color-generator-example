require 'sinatra'
require 'color-generator'

get '/' do
  @saturation = (params[:saturation] || '0.5').to_f
  @lightness  = (params[:lightness] || '0.5').to_f
  @seed       = (params[:seed] || rand(10_000)).to_i
  @rgb_colors = []
  @num_colors = (params[:num_colors] || 100).to_i

  generator = ColorGenerator.new(
    saturation: @saturation,
    lightness: @lightness,
    seed: @seed
  )

  @num_colors.times do
    @rgb_colors << generator.create_hex
  end

  erb :index
end
