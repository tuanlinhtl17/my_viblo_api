class CommentsBroadcaster
  def load_comment_data comments
    ActionCable.server.broadcast "comment_channel", message: {
      action_type: "LOAD_COMMENTS_DATA",
      payload: comments.to_json
    }
  end

  def comment_created comment
    ActionCable.server.broadcast "comment_channel", message: {
      action_type: "CREATE_COMMENT_SUCCESS",
      payload: comment.to_json
    }
  end

  def comment_failed
    ActionCable.server.broadcast "comment_channel", message: {
      action_type: "CREATE_COMMENT_FAIL",
      payload: "Something went wrong"
    }
  end
end
