class ConsumersController < ApplicationController
  load_and_authorize_resource

  def update
    @consumer.update!(update_params)

    render json: {
        consumer: ConsumerSerializer.new(@consumer)
    }, status: :ok
  end

  private

  def update_params
    params.require(:consumer).permit(:first_name,
                                     :last_name)
  end
end