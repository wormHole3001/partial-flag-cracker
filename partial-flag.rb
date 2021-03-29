#!/usr/bin/env ruby
require 'digest'

hash = ARGV[0]
partial_flag = ARGV[1]
cracked_hash = false

begin
    for num in 0000..9999 do
        if (hash == (Digest::MD5.hexdigest partial_flag + "%04d" % num.to_s))
            puts "Cracked Hash: " + partial_flag + "%04d" % num.to_s
            cracked_hash = true
        end
    end
rescue
    # Setting cracked_hash to true to prevent ensure message from showing
    cracked_hash = true
    puts "Something might have gone wrong."
    puts "Syntax: ./partial-flag <hash> <partial-flag>"
ensure
    if (!cracked_hash)
        puts "Unable to crack the hash."
    end
end