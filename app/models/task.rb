class Task < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :title

  def status
    self.complete ? 'complete' : 'incomplete'
  end
end
