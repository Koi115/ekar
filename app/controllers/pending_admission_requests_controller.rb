class PendingAdmissionRequestsController < ApplicationController

  def edit
    # 入院の処理を！
    @patient = Patient.find(params[:id])
    @admission = Admission.find_by(patient_id: @patient.id)
  end





  def update
    # paramsのidは、patientのid 
    @patient = Patient.find(params[:id])
    @admission = Admission.find_by(patient_id: @patient.id)    
    # admission table の更新 
    if params[:admission][:ward_id] == 1 || params[:admission][:ward_id] == 2 || params[:admission][:ward_id] == 9 || params[:admission][:ward_id] == nil
    #外来へ戻しならば、ステータスを変更update(show画面からの処理)
      @admission.update(ward_id: "2")
      redirect_to "/patients/#{@patient.id}"
    else
    #入院の場合は、params でupdate(edit画面からの処理)
      @admission.update(admission_params)
      redirect_to root_path
    end
  end


private
  def admission_params
    params.require(:admission).permit(:ward_id, :roombed_id, :admission_date, :hxofadm)
  end




end
