class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        activity.destroy
        head :no_content
    end


    private

    def render_not_found
        render json: { errors: "Activity Not Found" }, status: :not_found
    end

end
