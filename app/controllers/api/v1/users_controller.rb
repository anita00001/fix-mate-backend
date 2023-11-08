class Api::V1::UsersController < ApplicationController
  include Users::RegistrationsController
  include Users::SessionsController
end
