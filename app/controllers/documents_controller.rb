class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      @document.generate_box_document
      redirect_to document_path(@document)
    else
      render :new
    end
  end



  def show
    @document = Document.find(params[:id])
  end

  private

  def document_params
    params.require(:document).permit(:name, :doc)
  end

end
