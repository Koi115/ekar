class PendingAdmissionRequestsController < ApplicationController

  def edit
    # 入院の処理を！???ここか？admissioncontrollerでは？
    @patient = Patient.find(params[:id])
    @admission = Admission.find_by(patient_id: @patient.id)
  end





  def update
    # paramsのidは、patientのid 
    @patient = Patient.find(params[:id])
    @admission = Admission.find_by(patient_id: @patient.id)
    # admission table の更新

    if params[:key] == "outpatient"
      @admission.update(ward_id: "2")
      # redirect_to "/patients/#{@patient.id}"
      redirect_to root_path
    elsif params[:key] == "admission"
      # binding.pry
      @admission.update(admission_params)
      redirect_to root_path
    else
      # error
      # binding.pry
      redirect_to root_path
    end

  end


private
  def admission_params
    params.require(:admission).permit(:ward_id, :roombed_id, :admission_date, :hxofadm)
  end




end
