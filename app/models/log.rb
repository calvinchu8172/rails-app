class Log < ActiveRecord::Base

  strip_attributes

  serialize :extra, JSON

  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true

  scope :source, -> (source) { where(source_id: source.id, source_type: source.class.base_class.name) }
  scope :target, -> (target) { where(target_id: target.id, target_type: target.class.base_class.name) }
  scope :event, -> (event) { where(event: event.to_s.split(/\s*,\s*/)) }
  scope :since, -> (since_time) {
    # created_at >= since_time
    where(arel_table[:created_at].gteq(since_time))
  }
  scope :until, -> (until_time) {
    # created_at <= until_time
    where(arel_table[:created_at].lteq(until_time))
  }

  class << self
    def write(source, target, event, extra = nil)
      create(source: source, target: target, event: event, extra: extra)
    end
  end
end
