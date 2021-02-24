# frozen_string_literal: true

module TemplateGenerator
  module Generators
    module InstallHelpers
      def migration_path
        @migration_path ||= File.join('db', 'migrate')
      end

      def model_path
        @model_path ||= File.join('app', 'models', "#{file_path}.rb")
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if rails5?
      end
    end
  end
end
