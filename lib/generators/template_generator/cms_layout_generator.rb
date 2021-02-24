# frozen_string_literal: true

require 'rails/generators/base'
require 'generators/install_helpers'

module TemplateGenerator
  module Generators
    class CmsLayoutGenerator < Rails::Generators::Base
      source_root File.expand_path('cms_layout_templates', __dir__)

      argument :generator_args, type: :array, default: []
      class_option :path, type: :string, desc: 'Path to generate file'
      class_option :only, type: :array, default: [], desc: 'Files to be generated, '

      def create_files
        @file_path = options[:path]

        if options[:only].blank?
          create_admin_layout_files(run: true, file_path: "#{@file_path}")
        else
          options[:only].each do |option|
            try("create_#{option}_files", run: true, file_path: "#{@file_path}")
          end
        end
      end

      def create_admin_layout_files(run: false, file_path: '')
        if run
          template 'admin.html.haml', "app/views/layouts/admin.html.haml"
          template 'head.html.haml', "app/views/layouts/_head.html.haml"

          file_path = 'app/views/application' if file_path.blank?
          template 'toast.html.haml', "#{file_path}/_toast.html.haml"
          template 'header.html.haml', "#{file_path}/_admin_header.html.haml"
          template 'footer.html.haml', "#{file_path}/_admin_footer.html.haml"
          template 'sidenav.html.haml', "#{file_path}/_sidenav_admin.html.haml"
        end
      end
    end
  end
end
