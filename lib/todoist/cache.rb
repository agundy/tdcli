require 'fileutils'
require "json"

module TdCLI
    class Cache
        def initialize
            @_cache = {}
            unless File.directory?(DATA_DIR)
                FileUtils.mkdir(DATA_DIR)
            end

            @file_path = File.join(DATA_DIR, 'cache.json')
            load()
        end

        def set(data)
            @_cache = data
        end

        def get(item)
            return @_cache[item]
        end

        # load the cache from the data dir
        def load
            if File.exist?(@file_path)

              @_cache = JSON File.open(@file_path, &:read).strip
            else
                $stderr.puts "#{@file_path} does not exist"
            end
        end

        # save the cache to the data dir
        def save
            cache_json = JSON.generate @_cache
            File.open(@file_path, 'w') { |file| file.write(cache_json) }
        end
    end
end
