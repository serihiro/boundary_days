require 'boundary_days/version'
require 'date'

class BoundaryDays
  extend Forwardable
  def_delegators :@builder, :build

  class << self
    def all
      self.new(Builder.new.all)
    end

    def week
      self.new(Builder.new.week)
    end

    def month
      self.new(Builder.new.month)
    end
  end

  def from(value)
    @builder.from = value
    self
  end

  def to(value)
    @builder.to = value
    self
  end

  def beginning_of_week_wday(value)
    @builder.beginning_of_week_wday = value
    self
  end

  def end_of_week_wday(value)
    @builder.end_of_week_wday = value
    self
  end

  class Builder
    DEFAULT_LIMIT_DAYS = 365.freeze
    DEFAULT_BEGINNING_OF_WEEK_WDAY = 1.freeze
    DEFAULT_END_OF_WEEK_WDAY = 5.freeze

    def initialize
      @beginning_and_end_of_week = false
      @beginning_and_end_of_month = false
      @options = {}
      @boundary_days = []
    end

    def all
      @beginning_and_end_of_month = true
      @beginning_and_end_of_week = true
      self
    end

    def month
      @beginning_and_end_of_month = true
      @beginning_and_end_of_week = false
      self
    end

    def week
      @beginning_and_end_of_month = false
      @beginning_and_end_of_week = true
      self
    end

    def build(base_date = ::Date.today)
      from_date = @from || base_date
      to_date = @to || base_date + DEFAULT_LIMIT_DAYS
      beginning_of_week_wday = @beginning_of_week_wday || DEFAULT_BEGINNING_OF_WEEK_WDAY
      end_of_week_wday = @end_of_week_wday || DEFAULT_END_OF_WEEK_WDAY

      @boundary_days = []
      if @beginning_and_end_of_week
        @boundary_days += beginning_and_end_of_week(from_date, to_date, beginning_of_week_wday, end_of_week_wday)
      end

      if @beginning_and_end_of_month
        @boundary_days += beginning_and_end_of_month(from_date, to_date)
      end

      @boundary_days.uniq.sort
    end

    def beginning_and_end_of_week(from_date, to_date, beginning_of_week_wday, end_of_week_wday)
      return_days = []

      first_beginning_of_week = if from_date.wday <= beginning_of_week_wday
                                  d = Date.new(
                                    from_date.year,
                                    from_date.month,
                                    1
                                  )
                                  d + from_date.day + beginning_of_week_wday - from_date.wday - 1
                                else
                                  d = Date.new(
                                    from_date.year,
                                    from_date.month,
                                    1
                                  )
                                  d + from_date.day + 7 + beginning_of_week_wday - from_date.wday - 1
                                end
      first_end_of_week = if from_date.wday <= end_of_week_wday
                            d = Date.new(
                              from_date.year,
                              from_date.month,
                              1
                            )
                            d + from_date.day + end_of_week_wday - from_date.wday - 1
                          else
                            d = Date.new(
                              from_date.year,
                              from_date.month,
                              1
                            )
                            d + from_date.day + 7 + end_of_week_wday - from_date.wday - 1
                          end
      return_days += first_beginning_of_week.step(to_date, 7).to_a
      return_days += first_end_of_week.step(to_date, 7).to_a

      return_days
    end

    def beginning_and_end_of_month(from_date, to_date)
      return_days = []

      return_days += from_date.day == 1 ?
                     [ from_date, Date.new(from_date.year, from_date.month, -1) ] :
                     [ Date.new(from_date.year, from_date.month, -1) ]
      return_days += to_date == Date.new(to_date.year, to_date.month, -1) ?
                     [ Date.new(to_date.year, to_date.month, 1), to_date] :
                     [ Date.new(to_date.year, to_date.month, 1) ]

      from_date_next = from_date.next_month
      to_date_previous = to_date.prev_month

      loop_count = (to_date_previous.year - from_date_next.year) * 12 +
                    (to_date_previous.month - from_date_next.month + 1)

      target_date = from_date_next
      if loop_count > 1
        loop_count.times do |i|
          return_days << Date.new(target_date.year, target_date.month, 1)
          return_days << Date.new(target_date.year, target_date.month, -1)
          target_date = target_date.next_month
        end
      end

      return_days
    end

    def from=(value)
      @from = value
    end

    def to=(value)
      @to = value
    end

    def beginning_of_week_wday=(value)
      @beginning_of_week_wday = value
    end

    def end_of_week_wday=(value)
      @end_of_week_wday = value
    end
  end

  private

  def initialize(builder)
    @builder = builder
  end
end
