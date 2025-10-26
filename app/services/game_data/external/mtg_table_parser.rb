module GameData
  module External
    class MtgTableParser < ApplicationService
      BACKGROUND_COLORS = [
        "rgba(255, 99, 132, 0.12)",   # Soft Red
        "rgba(54, 162, 235, 0.12)",   # Soft Blue (complement to red)
        "rgba(255, 206, 86, 0.12)",   # Soft Yellow
        "rgba(75, 192, 192, 0.12)",   # Soft Teal (complement to yellow)
        "rgba(153, 102, 255, 0.12)",  # Soft Purple
        "rgba(255, 159, 64, 0.12)"    # Soft Orange (complement to purple)
      ]
      LINE_COLORS = [
        "rgba(255, 99, 132, 1)",   # Red
        "rgba(54, 162, 235, 1)",   # Blue (complement to red)
        "rgba(255, 206, 86, 1)",   # Yellow
        "rgba(75, 192, 192, 1)",   # Teal (complement to yellow)
        "rgba(153, 102, 255, 1)",  # Purple
        "rgba(255, 159, 64, 1)"    # Orange (complement to purple)
      ]
      PAUSE_COLOR = "rgba(50, 50, 50, 0.12)"

      def initialize(game:)
        @game = game
        @data = game.data["external_data"]
      end

      def call
        extract_times
        {
          graph: graph_data
        }
      end

      private

      attr_reader :game, :data, :start_time, :end_time

      def extract_times
        @start_time = Time.zone.parse(data["started"])
        @end_time = [Time.zone.parse(data["turn_tracking"].last["end_time"]),
          Time.zone.parse(data["health_changes"].last["at"])].max
      end

      def graph_data
        {
          "legend" => {},
          "tooltip" => {trigger: "axis"},
          "xAxis" => {
            type: "value",
            label: "Time"
          },
          "yAxis" => {
            type: "value",
            label: "Health"
          },
          "series" => health_graph + turn_series
        }
      end

      def turn_series
        [{
          type: "line",
          data: [],
          silent: true,
          z: 0,
          lineStyle: {opacity: 0},
          symbol: "none",
          markArea: {
            silent: true,
            itemStyle: {
              color: "rgba(0,0,0,0.08)"
            },
            label: {
              show: true,
              position: "insideTopLeft"
            },
            data: data["turn_tracking"].map do |turn|
              color = if turn["current_player_index"].present?
                BACKGROUND_COLORS[turn["current_player_index"]]
              else
                PAUSE_COLOR
              end
              [
                {xAxis: game_time(turn["start_time"]), itemStyle: {color: color}},
                {xAxis: game_time(turn["end_time"])}
              ]
            end
          }
        }]
      end

      def game_time(time)
        (Time.zone.parse(time) - start_time).seconds
      end

      def health_graph
        @game.players.map do |player|
          index = find_player_index(player.controller.id)
          {
            type: "line",
            name: player.display_name,
            data: extract_health(index),
            lineStyle: {
              color: LINE_COLORS[index]
            },
            itemStyle: {
              color: LINE_COLORS[index]
            }
          }
        end
      end

      def extract_health(index)
        current_health = data["start_health"]
        health = [[0, current_health]]
        data["health_changes"].each do |row|
          next unless row["target_player_index"] == index

          current_health += row["change"]
          health << [game_time(row["at"]), current_health]
        end
        health
      end

      def find_player_index(id)
        data["players"].index { |x| x["aic_id"] == id }
      end
    end
  end
end
