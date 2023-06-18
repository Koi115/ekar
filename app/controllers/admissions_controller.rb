class AdmissionsController < ApplicationController

    
    def update
      # paramsのidは、patientのid
      @patient = Patient.find(params[:id])
      @admission = Admission.find_by(patient_id: @patient.id)
      
      # admission table の更新 
      if @admission.update(ward_id: "9", roombed_id: "1", admission_date: "", hxofadm: "")
        redirect_to root_path
      else
      # error
      # binding.pry
        redirect_to "/patients/#{@patient.id}"
      end
    end



end
