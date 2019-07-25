require 'bundler'
Bundler.require

require_relative 'lib/application'

# lancement de l'application
Application.new.perform