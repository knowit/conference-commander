# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :text
#  venue_id   :integer
#

class Track < ApplicationRecord
  has_many :event_sessions
  belongs_to :venue

  def has_overlapping_event_sessions?
    overlapping_event_sessions.present?
  end

  def overlapping_event_sessions
    colliding_times = []
    all_session_times = event_sessions.order(:start_time).map{ |es| [es, es.time_interval] }
    while all_session_times.present?
      es, interval = all_session_times.pop
      all_session_times.each do |es2, interval2|
        next if es.id == es2.id
        intersection = time_interval_intersection(interval, interval2)
        colliding_times << intersection if intersection.present?
      end
    end
    colliding_times
  end

  def overlaps_in_track(event_session)
    colliding_times = []
    all_session_times = event_sessions.order(:start_time).map{ |es| [es, es.time_interval] }
    all_session_times.each do |other, interval|
      next if event_session.id == other.id
      intersection = time_interval_intersection(event_session.time_interval, interval)
      colliding_times << intersection if intersection.present?
    end
    colliding_times
  end

  def to_s
    name
  end

  private

  def time_interval_intersection(a, b)
    return nil if (a.max < b.begin or b.max < a.begin)
    [a.begin, b.begin].max..[a.max, b.max].min
  end
end
