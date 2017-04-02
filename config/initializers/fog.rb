CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIP2JXZVLW4DJQFOA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-west-1',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'hackthon-likelion'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
