class CommentsController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new comment_create_params
    @comment.agent_ip = request.headers['X-Forwarded-For'] ||
                        request.headers['REMOTE_ADDR']

    if @comment.save
      render json: @comment
    else
      render json: @comment, status: 422
    end
  end

  private

  def comment_create_params
    params.require(:comment).permit(
      :report_id,
      :content,
      :agent,
      :commenter_network,
      :commenter_username
    )
  end
end
