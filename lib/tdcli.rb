require "thor"

require_relative "todoist/client.rb"
require_relative "todoist/cache.rb"

class TDCLI < Thor
    def initialize(*args)
        super
        @todoistClient = TdCLI::Client.new
        @cache = TdCLI::Cache.new
    end

    desc 'tasks', 'list all tasks'
    def tasks
        items = @cache.get('Items')
        items.each do |item|
            puts "- #{item['content']}"
        end

    end

    desc 'user', 'get all user information'
    def user
        user = @cache.get('User')
        user.each do |key, value|
            puts "#{key}: #{value}"
        end
    end

    desc 'update', 'update Todoist cache'
    def update
        resource_types = ["all"]
        data = @todoistClient.sync(resource_types)
        @cache.set(data)
        @cache.save()
    end

    desc 'projects', 'show all users projects'
    def projects
        projects = @cache.get('Projects').sort_by {|hsh| hsh['item_order']}
        projects.each do |project|
            puts ' ' *(project['indent']-1) + "#{project['name']}"
        end
    end

end
