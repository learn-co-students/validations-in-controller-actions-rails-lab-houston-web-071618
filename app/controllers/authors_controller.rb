class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    # needs to be .new not-yet-validated Post object from the form.
    @author = Author.new(author_params)

    if @author.valid?
      # if true save it
      @author.save
      # redirect to show the created author
      redirect_to author_path(@author)
    else
      # return error message
      # render new page but keep the input from the create method
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
