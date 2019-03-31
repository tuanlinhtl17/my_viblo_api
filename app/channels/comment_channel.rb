class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_channel"
  end

  def unsubscribed
  end

  def request_comment data
    post_id = data["post_id"]
    comments = Comment.belongs_to_post post_id
    broadcaster = CommentsBroadcaster.new
    broadcaster.load_comment_data comments
  end

  def create_comment params
    comment = Comment.new post_id: params["post_id"], content: params["content"]
    comment.user_id = 1
    broadcaster = CommentsBroadcaster.new
    if comment.save
      broadcaster.comment_created comment
    else
      broadcaster.comment_failed
    end
  end

  private
      
  def comment_params
    params.require(:comment).permit :user_id, :post_id, :content
  end
end
