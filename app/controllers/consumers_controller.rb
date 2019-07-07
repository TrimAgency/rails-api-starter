class ConsumersController < ApplicationController
  CONSUMER_ROOT = 'consumer'.freeze
  load_and_authorize_resource

  def update
    @consumer.update!(update_params)

    render json: ConsumerSerializer.render(@consumer, root: CONSUMER_ROOT), 
           status: :ok
  end

  private

  def update_params
    params.require(:consumer).permit(:first_name,
                                     :last_name)
  end
end