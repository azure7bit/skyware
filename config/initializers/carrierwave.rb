cw_config = File.open(File.join(CONFIG_ROOT, 'carrierwave.yml'))
cw_config = YAML.load(cw_config).symbolize_keys

CarrierWave.configure do |config|
  config.fog_attributes  = cw_config[:cache_options]
  config.fog_credentials = cw_config[:aws_credentials].symbolize_keys
  config.fog_directory   = cw_config[:s3_bucket]
  config.root            = cw_config[:root_dir]
  config.cache_dir       = cw_config[:cache_dir]
end
