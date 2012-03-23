class CombatController < ApplicationController
  def initiative
    if params[:encounter_id].present?
      encounter = Encounter.find(params[:encounter_id])
      @initiatives = encounter.roll_initiative.map{|k,v| "#{k} #{v}"}
    end
  end
end
