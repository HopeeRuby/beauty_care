# frozen_string_literal: true

CarrierWave.configure do |config|
  # Configure the file storage directory on the hard disk
  config.root = Rails.root.join('public')

  # Configure a temporary directory to store files before uploading to the server
  config.cache_dir = Rails.root.join('tmp', 'uploads')
  # Configure regex to canonicalize file names
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
