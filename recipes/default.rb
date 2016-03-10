#
# Cookbook Name:: f5_configurator_cookbook
# Recipe:: default
#
# Copyright (c) 2016 Austin Heiman, All Rights Reserved.

require_relative "../lib/f5_configurator"
require_relative "../lib/f5_objects"

configurator = F5Configurator.new node[:api_base_url]

data_bag(node[:f5_config_data_bag]).each do |item|
  f5_objects = data_bag_item(node[:f5_config_data_bag], item)
  f5_objects[:objects].each do |object|
    # check if object exists in f5
    # TODO
    # if object exists, send PUT to update it
    configurator.update object
    # if object does not exist, send POST to create it
    configurator.create object
  end
end
