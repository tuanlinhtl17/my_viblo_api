# frozen_string_literal: true

# API version 1
class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i(show update destroy)

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new post_params
    if @post.save
      render json: @post, status: :created,
              location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update post_params
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: {
        status: :success,
      }
    else
      render json: {
        status: :error,
      }
    end
  end

  private

  def set_post
    @post = Post.find_by id: params[:id]
  end

  def post_params
    params.require(:post).permit :title, :content, :slug
  end
end
