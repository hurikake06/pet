# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  NO_PRESENCE_MESSAGE = '※必須です'
  NO_UNIQUE_MESSAGE = '※既に登録されています'
end
