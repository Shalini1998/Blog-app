class CommentsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	  def create
	    @dictionary = Dictionary.find(params[:dictionary_id])
	    @comment = @dictionary.comments.create(comment_params)
	    redirect_to dictionary_path(@dictionary)
	  end
	 
	  def destroy
	    @dictionary = Dictionary.find(params[:dictionary_id])
	    @comment = @dictionary.comments.find(params[:id])
	    @comment.destroy
	    redirect_to dictionary_path(@dictionary)
	  end
	 
	  private
	    def comment_params
	      params.require(:comment).permit(:commenter, :body)
	    end
	end