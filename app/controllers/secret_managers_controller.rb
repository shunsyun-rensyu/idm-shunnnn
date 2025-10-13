class SecretManagersController < ApplicationController
  include ActionController::Live

  attr_accessor :secrets

  def index
    @secrets = SecretManager.all
    render json: @secrets
  end

  def show
    @secret = SecretManager.find(params[:id])
    render json: @secret
  end

  def create
    @secret = SecretManager.new(secret_params)
    if @secret.save
      render json: @secret, status: :created
    else
      render json: @secret.errors, status: :unprocessable_entity
    end
  end

  def update
    @secret = SecretManager.find(params[:id])
    if @secret.update(secret_params)
      render json: @secret
    else
      render json: @secret.errors, status: :unprocessable_entity
    end
  end

  private

  def secret_params
    params.permit(:where, :who, :what, :when, :description)
  end
end