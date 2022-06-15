module Api
  module V1
    class LinksController < ApplicationController
      before_action :set_short_link, only: %i[show]

      def show
        redirect_to(@short_link.destination,  allow_other_host: true)
      end

      private

      def set_short_link
        @short_link = ShortLink.find_by(slug: params[:slug])
      end
    end
  end
end
