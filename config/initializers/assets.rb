# Be sure to restart your server when you modify this file.

Rails.application.config.assets.precompile += %w( aucs-v2.css )
Rails.application.config.assets.precompile += %w( bootstrap-theme.min.css)
Rails.application.config.assets.precompile += %w( posts.css)
Rails.application.config.assets.precompile += %w( jquery.timepicker.min.js)
Rails.application.config.assets.precompile += %w( jquery.timepicker.css)

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
