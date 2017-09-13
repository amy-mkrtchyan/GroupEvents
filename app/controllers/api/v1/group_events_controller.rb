module Api::V1
  class GroupEventsController < ApiController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    before_action :set_group_event, only: [:show, :update, :destroy, :publish]

    # GET /v1/group_events
    def index
      @group_events = GroupEvent.all

      render json: @group_events
    end

    # GET /v1/group_events/1
    def show
      render json: @group_event
    end

    # POST /v1/group_events
    def create
      @group_event = GroupEvent.new(group_event_params)

      if @group_event.save
        render json: @group_event, status: :created, location: v1_group_event_url(@group_event)
      else
        render json: @group_event.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/group_events/1
    def update
      if @group_event.update(group_event_params)
        render json: @group_event
      else
        render json: @group_event.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/group_events/1
    def destroy
      @group_event.destroy
    end

    # PATCH/PUT /v1/group_events/1/publish
    def publish
      if @group_event.valid?(:publish)
        @group_event.publish
        render json: @group_event
      else
        render json: @group_event.errors, status: :unprocessable_entity
      end
    end

    private
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_event_params
      params.require(:group_event).permit(:name, :description, :location, :starts_at, :ends_at, :duration)
    end

    def render_not_found
      render json: {error: I18n.t('group_event.not_found')}, status: :not_found
    end
  end
end
