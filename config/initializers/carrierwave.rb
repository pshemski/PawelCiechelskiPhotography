if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # configurations for AWS S3
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      host: 's3-eu-west-2.amazonaws.com',
      region: 'eu-west-2'
    }
    config.fog_directory = ENV['S3_BUCKET']
  end
end
