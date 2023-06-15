class AdmissionsController < ApplicationController

    
    def update
      # paramsのidは、patientのid
      @patient = Patient.find(params[:id])
      @admission = Admission.find_by(patient_id: @patient.id)
      
      # admission table の更新 
      if @admission.update(ward_id: "9", roombed_id: "1", admission_date: "", hxofadm: "")
        redirect_to root_path
      else
      #失敗のエラー表示をして。
      binding.pry
        redirect_to "/patients/#{@patient.id}"
      end
    end
    
    
    # private
    
      # def contact_params
      #   params.require(:contact).permit(:full_name1, :full_name_kana1, :relation1, :phone_number11, :phone_number12, :description1, :full_name2, :full_name_kana2, :relation2, :phone_number21, :phone_number22, :description2)
      # end


end
