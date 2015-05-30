class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    @sausages = Sausage.order(:name)
  end
end
