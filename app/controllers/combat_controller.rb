class CombatController < ApplicationController
  def initiative
    if params[:encounter_id].present?
      @encounter = Encounter.find(params[:encounter_id])
    end
  end
end
