# CarrierWave.configure do |config|
#   config.asset_host = 'http://localhost:3000'
# end

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  # 検証
  # config.storage :file
  # config.asset_host = 'http://localhost:3000'
end