# frozen_string_literal: true

require 'rails/generators/base'
require 'generators/install_helpers'

module PresetGenerator
  module Generators
    class StylesheetsGenerator < Rails::Generators::Base
      source_root File.expand_path('stylesheets_templates', __dir__)

      argument :generator_args, type: :array, default: []

      def create_files
        create_assets_files(run: true)
      end

      def create_assets_files(run: false)
        if run
          # copy all style files
          directory 'stylesheets', 'app/assets/stylesheets'
          template 'packs/style.sass', "app/javascript/packs/style.sass"

          # add foundation and jquery to application.js
          append_to_file 'app/javascript/packs/application.js' do
<<-EOF
import $ from "jquery"
import "foundation-sites"
Foundation.addToJquery($)
$(document).on("turbolinks:load", function() {
  $(document).foundation();
});
EOF
          end

          append_to_file 'app/javascript/packs/application.js', :after => "require(\"channels\")\n" do
<<-EOF
require("jquery")
EOF
          end

          # add js dependencies to package
          append_to_file 'package.json', :after => "\"dependencies\": {\n" do
<<-EOF
    "foundation-sites": "^6.6.3",
    "jquery": "^3.5.1",
    "motion-ui": "^2.0.3",
EOF
          end

          # change webpacker config
          gsub_file 'config/webpacker.yml', /\bresolved_paths.*/, "resolved_paths: ['app/assets']"
          gsub_file 'config/webpacker.yml', /\bextract_css.*/, "extract_css: true"
        end
      end
    end
  end
end
