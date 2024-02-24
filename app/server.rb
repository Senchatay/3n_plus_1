# frozen_string_literal: true

require 'sinatra'
require_relative 'task'
require 'chartkick'

get '/all' do
  @data = (0...3).map do |chart_n|
    offset = chart_n * 1000
    line_chart(
      [{
        name: 'Длина сиракузской последовательности', data: Task.calculate_slice((offset + 1..offset + 1000))
      }],
      loading: 'Loading...',
      adapter: 'highcharts'
    )
  end
  erb :index
end

get '/max' do
  @data = [line_chart(
    [{
      name: 'Длина сиракузской последовательности', data: Task.max_from_slice((1..1_000_000))
    }],
    loading: 'Loading...',
    adapter: 'highcharts'
  )]
  erb :index
end

configure do
  set :environment, ENV['SINATRA_ENV']
  set :bind, ENV['SINATRA_HOSTNAME']
  set :port, ENV['SINATRA_PORT']
end
