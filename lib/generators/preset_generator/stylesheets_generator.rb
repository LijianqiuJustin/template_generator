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
          directory 'stylesheets', 'app/assets'
          template 'packs/style.sass', "app/javascripts/style.sass"


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

        end
      end
    end
  end
end
