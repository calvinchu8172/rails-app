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

  # 寫入 Log
  def self.write(source, targets, event, extras = nil)
    source_id   = source.respond_to?('id') ? source.id : source
    source_type = source.class.base_class.to_s rescue nil
    targets     = targets.is_a?(Array) ? targets : [targets]
    extras      = extras.is_a?(Array) ? extras : [extras]

    # column 中的每個 element 代表 Hash 中的 Key
    column = [:source_id, :source_type, :target_id, :target_type, :event, :extra]
    values = targets.map.with_index do |target, i|
      [source_id, source_type, target.id, target.class.base_class.to_s, event, extras[i]]
    end
    Log.import column, values, validate: false
  end
end
