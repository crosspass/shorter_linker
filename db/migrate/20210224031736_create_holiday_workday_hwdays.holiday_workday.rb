# This migration comes from holiday_workday (originally 20210223095959)
class CreateHolidayWorkdayHwdays < ActiveRecord::Migration[6.0]
  def change
    create_table :holiday_workday_hwdays do |t|
      t.date :date
      t.integer :day_type
    end
    add_index :holiday_workday_hwdays, :date
    add_index :holiday_workday_hwdays, :day_type
  end
end
