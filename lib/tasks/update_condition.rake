namespace :update do

  desc 'Update Boulder Creek Weather Conditions'
  task now: :environment do
    update_boulder_creek
  end

  def update_boulder_creek
    UpdateConditionService.condition('boulder_creek')
  end
end
