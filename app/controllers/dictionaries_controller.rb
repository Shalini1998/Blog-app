class DictionariesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	def index
	   # @dictionaries = Dictionary.all
     @q = Dictionary.ransack(params[:q])
      @dictionaries = @q.result(distinct: true)
	 end
	def show
	    @dictionary = Dictionary.find(params[:id])
	  end
  def new
  	@dictionary = Dictionary.new
  end
  def edit
    @dictionary = Dictionary.find(params[:id])
  end

 def create
   @dictionary = Dictionary.new(dictionary_params)
   if @dictionary.save
       redirect_to @dictionary
     else
       render 'new'
    end
 end
 def update
   @dictionary = Dictionary.find(params[:id])
  
   if @dictionary.update(dictionary_params)
     redirect_to @dictionary
   else
     render 'edit'
   end
 end
 def destroy
   @dictionary = Dictionary.find(params[:id])
   @dictionary.destroy
 
   redirect_to dictionaries_path
 end
 private
   def dictionary_params
     params.require(:dictionary).permit(:title, :description)
   end
end
