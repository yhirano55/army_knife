# frozen_string_literal: true

module ArmyKnife
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def configure_app
        # do something
      end

      def install_gems
        if yes?("Install `rails-18n`?")
          gem "rails-i18n"
        end

        if yes?("Install `enum_help`?")
          gem "enum_help"
        end

        gem_group :development, :test do
          if yes?("Install `awesome_print`?")
            gem "awesome_print"
          end

          if yes?("Install `hurb`?")
            gem "hirb-unicode-steakknife"
          end

          if yes?("Using `pry`?")
            gem "pry-rails"

            %w(byebug doc inline rescue stack_explorer state).each do |suffix|
              full_name = "pry-#{suffix}"
              gem(full_name) if yes?("Install `#{full_name}`?")
            end
          end

          if yes?("Install `activerecord-cause`?")
            gem "activerecord-cause"
          end

          # TODO: Configure
          if yes?("Install `bullet`?")
            gem "bullet"
          end

          if yes?("Install `factory_girl_rails`?")
            gem "factory_girl_rails"
          end

          if yes?("Install `takarabako`?")
            gem "takarabako"
          end

          if yes?("Install `faker`?")
            gem "faker"
          end

          if yes?("Install `seed-fu`?")
            gem "seed-fu"
          end
        end

        gem_group :development do
          if yes?("Install `annotate`?")
            gem "annotate"
          end

          if yes?("Install `better_errors`?")
            gem "better_errors"
            gem "binding_of_caller"
          end

          if yes?("Install `rubocop`?")
            gem "omawari", require: false
            # TODO: run after bundle install
            # run "omawari"
          end

          if yes?("Install `rack-mini-profiler`?")
            gem "rack-mini-profiler", require: false
          end
        end

        gem_group :test do
          if yes?("Install `database_cleaner`?")
            gem "database_cleaner"
          elsif yes?("Install `database_rewinder`?")
            gem "database_rewinder"
          end
        end
      end

      # def bundle
      #   run "bundle install"
      # end
    end
  end
end
