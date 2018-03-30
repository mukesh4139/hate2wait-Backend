class TokensController < ApplicationController
  def index
    if params[:type]
      @export_tokens = Token.where(token_type: Token.token_types[params[:type]], served: false).order('created_at')
    else
      @export_tokens = Token.where(served: false).order('created_at')
    end

    if !params[:message].nil?
      @export_tokens = @export_tokens.where("lower(message) LIKE ? ", "%"+params[:message].downcase()+"%")
    end

    @tokens = @export_tokens.page(params[:page]).per(100)
    respond_to do |format|
      format.html {}
      format.json {render json: @tokens}
    end
  end

  def new
    @token = Token.new
  end

  def show
    @token = Token.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json {render json: @token}
    end
  end

  def create
    @token = Token.new(token_params)
    respond_to do |format|
      if @token.save
        format.html { redirect_to tokens_path, notice: 'Token was successfully created.' }
        format.json { render json: @token, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  def clear_queue
    if Token.update_all(served: true)
      render json: {message: "Queue Successfully Cleared"}
    else
      render json: {message: "Some error occured while trying to clear the queue"}
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def token_params
    params.require(:token).permit(:token_type, :message, :client_id)
  end
end
