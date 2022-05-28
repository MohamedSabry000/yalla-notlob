# encoding: UTF-8

# This file contains data derived from the IANA Time Zone Database
# (https://www.iana.org/time-zones).

module TZInfo
  module Data
    module Definitions
      module Asia
        module Seoul
          include TimezoneDefinition
          
          timezone 'Asia/Seoul' do |tz|
            tz.offset :o0, 30472, 0, :LMT
            tz.offset :o1, 30600, 0, :KST
            tz.offset :o2, 32400, 0, :JST
            tz.offset :o3, 32400, 0, :KST
            tz.offset :o4, 32400, 3600, :KDT
            tz.offset :o5, 30600, 3600, :KDT
            
            tz.transition 1908, 3, :o1, -1948782472, 26114747191, 10800
            tz.transition 1911, 12, :o2, -1830414600, 116131303, 48
            tz.transition 1945, 9, :o3, -767350800, 19453649, 8
            tz.transition 1948, 5, :o4, -681210000, 19461625, 8
            tz.transition 1948, 9, :o3, -672228000, 29193685, 12
            tz.transition 1949, 4, :o4, -654771600, 19464073, 8
            tz.transition 1949, 9, :o3, -640864800, 29198041, 12
            tz.transition 1950, 3, :o4, -623408400, 19466977, 8
            tz.transition 1950, 9, :o3, -609415200, 29202409, 12
            tz.transition 1951, 5, :o4, -588848400, 19470177, 8
            tz.transition 1951, 9, :o3, -577965600, 29206777, 12
            tz.transition 1954, 3, :o1, -498128400, 19478577, 8
            tz.transition 1955, 5, :o5, -462702600, 116891143, 48
            tz.transition 1955, 9, :o1, -451733400, 116897237, 48
            tz.transition 1956, 5, :o5, -429784200, 116909431, 48
            tz.transition 1956, 9, :o1, -418296600, 116915813, 48
            tz.transition 1957, 5, :o5, -399544200, 116926231, 48
            tz.transition 1957, 9, :o1, -387451800, 116932949, 48
            tz.transition 1958, 5, :o5, -368094600, 116943703, 48
            tz.transition 1958, 9, :o1, -356002200, 116950421, 48
            tz.transition 1959, 5, :o5, -336645000, 116961175, 48
            tz.transition 1959, 9, :o1, -324552600, 116967893, 48
            tz.transition 1960, 4, :o5, -305195400, 116978647, 48
            tz.transition 1960, 9, :o1, -293103000, 116985365, 48
            tz.transition 1961, 8, :o3, -264933000, 117001015, 48
            tz.transition 1987, 5, :o4, 547578000
            tz.transition 1987, 10, :o3, 560883600
            tz.transition 1988, 5, :o4, 579027600
            tz.transition 1988, 10, :o3, 592333200
          end
        end
      end
    end
  end
end
