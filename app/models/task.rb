class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title

  def status
    self.complete ? 'complete' : 'incomplete'
  end
end
