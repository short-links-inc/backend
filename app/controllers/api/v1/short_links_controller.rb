module Api
  module V1
    class ShortLinksController < ApplicationController
      before_action :set_short_links, only: %i[index]
      before_action :set_new_short_link, only: %i[create]
      before_action :set_short_link, only: %i[show update destroy]

      def index
        render json: @short_links
      end

      def show
        render json: @short_link
      end

      def create
        if @short_link.save
          render json: @short_link, status: :created
        else
          render_unprocessable_entity @short_link
        end
      end

      def update
        if @short_link.update(short_link_params)
          render json: @short_link
        else
          render_unprocessable_entity @short_link
        end
      end

      def destroy
        if @short_link.destroy
          render json: @short_link
        else
          render_unprocessable_entity @short_link
        end
      end

      private

      def set_short_links
        @short_links = ShortLink.all
      end

      def set_short_link
        @short_link = ShortLink.find(params[:id])
      end

      def set_new_short_link
        @short_link = ShortLink.new short_link_params
      end

      def short_link_params
        params.require(:short_link).permit(:slug, :destination)
      end
    end
  end
end
