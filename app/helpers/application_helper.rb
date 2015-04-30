# Helpers methods that can be used within the children of ApplicationController
module ApplicationHelper
  # Because we're storing our assets outside of the Rails Asset Pipeline, we
  # need to re-implement the asset_path path helper (as gulp_asset_path to
  # reference un-hashed files in development, and the cacheable hashed versions
  # of the files in production.

  # This method makes it possible to easily reach assets in the gulp directory.
  #
  # Example:
  #   Rails:              <%= image_tag, 'asset.png' %>
  #   Replace with gulp:  <img src="<%= gulp_asset_path('asset.png') %>">
  #
  # @param path [String] the path to the actual file
  # @return [String] the full path to the asset within the gulp directory
  def gulp_asset_path(path)
    path = REV_MANIFEST[path] if defined?(REV_MANIFEST)
    "/assets/#{path}"
  end
end
