# frozen_string_literal: true

class Person < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :avatar

  def avatar_image_url
    url_for(avatar) if avatar.attached?
  end
end
