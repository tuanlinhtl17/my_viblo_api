module Api
  module V1
    class CommentsController < ApplicationController
      before_action :load_comment, only: %i(destroy)
    
      def create
        @comment = Comment.new_comment comment_params
        @comment.user_id = 1
        broadcaster = CommentsBroadcaster.new
        if @comment.save
          broadcaster.comment_created @comment
        else
          broadcaster.comment_failed
        end
      end
      
      def destroy
        parent_id = @comment.parent_id
        if @comment.destroy
          render json: {
            status: :success,
          }
        else
          render json: {
            status: :error
          }
        end
      end
      
      private
      
      def comment_params
        params.require(:comment).permit :user_id, :content
      end
      
      def load_comment
        @comment = Comment.find_by id: params[:id]
        return if @comment
        render json: {
          status: :error
        }
      end
    end
  end
end
